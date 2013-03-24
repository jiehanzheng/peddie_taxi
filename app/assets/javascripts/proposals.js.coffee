# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require bootstrap-datetimepicker

$ ->
  $("#leaving_at_picker").datetimepicker {
    language: 'en'
    pick12HourFormat: true
    pickSeconds: false
  }

  $("#returning_at_picker").datetimepicker {
    language: 'en'
    pick12HourFormat: true
    pickSeconds: false
  }
