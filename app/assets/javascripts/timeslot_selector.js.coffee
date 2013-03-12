$ ->
  console.log "timeslot_selector is initializing..."

  # enable datepicker on date field
  $(document).on "focus", "[data-behavior~='datepicker']", ->
      $(this).datepicker { "format": "mm/dd/yyyy", "weekStart": 1, "autoclose": true }

  #
  # implement the Add Slot button

  # immediately save a unfilled copy of the row as our "template"
  template = $(".departure-time_item_template").clone()

  # hide remove button for first one, also the only one now
  $(".departure-time_remove-slot-btn").hide()

  $(".controls#departure-time").on 'click', ".departure-time_add-slot-btn", ->
    # clone template to the end of parent element
    template.clone().appendTo $(".controls#departure-time")
    hideOrShowButtons()

  $(".controls#departure-time").on 'click', ".departure-time_remove-slot-btn", (eventObject) ->
    $(this).parents(".departure-time_item").remove()
    hideOrShowButtons()

hideOrShowButtons = () ->
  # hide all add buttons except for the last one
  $(".departure-time_item:not(:last-of-type) .departure-time_add-slot-btn").hide()
  $(".departure-time_item:last-of-type .departure-time_add-slot-btn").show()

  # show all remove buttons if # of row >= 2
  if $(".departure-time_item").length >= 2
    $(".departure-time_remove-slot-btn").show()
  else
    $(".departure-time_remove-slot-btn").hide()
