# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  $('div.relative_week.btn-group > button').click ->
    $("#proposal_relative_week").attr 'value', $(this).val()
