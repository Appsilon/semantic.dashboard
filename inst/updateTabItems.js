/* update_tab_items */
Shiny.addCustomMessageHandler('update_tab',
  function(custom_tab) {
    $(`#uisidebar [data-value='${custom_tab}']`).click();
  }
)
