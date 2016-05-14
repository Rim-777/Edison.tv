# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  setFileUploader()

$(document).on 'click', '.close_progress_modal_button',  (e) ->
  $('.progress_modal_body').html('');

