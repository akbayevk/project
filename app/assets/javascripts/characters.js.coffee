# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ($) ->
  picturesOptions = {
    itemSelector: ".picture",
    containerSelector: ".pictures-container",
    addSelector: ".picture-add",
    removeSelector: ".picture-remove",
    itemTemplateSelector: ".picture.template",
    new_item_index: "new_picture_index"
  }

  $(".form-horizontal").nestedFields({
    itemSelector: ".event_detail",
    containerSelector: ".event_details-container",
    addSelector: ".event_detail-add",
    removeSelector: ".event_detail-remove",
    itemTemplateSelector: ".event_detail.template",
    new_item_index: "new_event_detail_index",
    afterInsert: (item) ->
      # Applies nestedFields to this event_detail's pictures
      item.find(".nested-level-2").nestedFields(picturesOptions)
      # Inserts a picture item
      item.find(".nested-level-2").nestedFields("insert")
  })

  # Applies nestedFields to all projects on page
  $(".form-horizontal").find(".nested-level-2").nestedFields(picturesOptions)