function sidebar_observer(id) {
  /* Code below is needed to trigger visibility on reactive Shiny outputs. */
  /* Thanks to that users do not have to set suspendWhenHidden to FALSE.   */
  let previous_tab;
  $(`#${id} .item`).tab({
    onVisible: function(target) {
      if (previous_tab) {
        $(this).trigger('hidden');
      }
      $(window).resize();
      $(this).trigger('shown');
      previous_tab = this;
      prefix = "shiny-tab-"
      Shiny.setInputValue(`${id}`, this.id.substring(prefix.length), {priority: "event"});
    }
  });

  $(`#${id}`)
    .sidebar({
      context: $('.pusher'),
      transition: 'push',
      dimPage: false,
      closable: false
    })
    .sidebar('attach events', '#toggle_menu');


    let set_pusher_size = function(on_click) {
      let sidebar = $(`#${id}`);
      let window_width = $(window).width();
      let pusher = $('.container > .pusher');
      let is_sidebar_visible_after_transition = sidebar.hasClass('visible')
      if (on_click) {
        is_sidebar_visible_after_transition = !is_sidebar_visible_after_transition
      };
      if (is_sidebar_visible_after_transition) {sidebar_width = sidebar.width()} else {sidebar_width = 0};
      if (sidebar.hasClass('left')) {margin_left = sidebar_width} else {margin_left = 0};
      if (sidebar.hasClass('right')) {margin_right = sidebar_width} else {margin_right = 0};
      pusher.width(window_width - sidebar_width);
      pusher.css({'margin-left' : margin_left, 'margin-right' : margin_right});
    };
    $('#toggle_menu').click(function() {set_pusher_size(true)});
    $(document).ready(function() {set_pusher_size(false)});
    $(window).resize(function() {set_pusher_size(false)});
}
