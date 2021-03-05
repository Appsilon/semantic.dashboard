/*
  SIDEBAR
*/
const initialize_sidebar = (closable, pushable, overlay, dimPage) => {
  transitionLeftRight = overlay ? 'overlay' : 'uncover';
  $(document).on('shiny:sessioninitialized', function(event) {
    $('.ui.sidebar')
    .sidebar({
      context: $('.bottom.segment'),
      closable,
      dimPage,
      defaultTransition: {
        computer: {
          left   : transitionLeftRight,
          right  : transitionLeftRight,
          top    : 'overlay',
          bottom : 'overlay'
        },
        mobile: {
          left   : transitionLeftRight,
          right  : transitionLeftRight,
          top    : 'overlay',
          bottom : 'overlay'
        }
      }
    })

    $('#toggle_menu').click(function() {
      $(window).resize();
    })

    if(pushable) {
      $('.ui.sidebar').sidebar('attach events', '#toggle_menu');
    }

    /* Code below is needed to trigger visibility on reactive Shiny outputs. */
    /* Thanks to that users do not have to set suspendWhenHidden to FALSE.   */
    let previous_tab;
    $(`#uisidebar .item`).tab({
      onVisible: function(target) {
        if (previous_tab) {
          $(this).trigger('hidden');
        }
        $(window).resize();
        $(this).trigger('shown');
        previous_tab = this;
        prefix = "shiny-tab-"
        Shiny.setInputValue("uisidebar", this.id.substring(prefix.length), {priority: "event"});
      }
    });
  });
}
