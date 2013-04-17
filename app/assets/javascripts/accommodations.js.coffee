# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require bootstrap-timepicker

$ ->

  $('div#day_of_week.btn-group > button').on 'click', ->
    $("#accommodation_day_of_week").attr 'value', $(this).val()
    $('#natural_times').html "You selected <strong>" + $(this).data('stupid-people-format') + '</strong>.'

  $('#accommodation_leaving_at').timepicker()
  $('#accommodation_returning_at').timepicker()
