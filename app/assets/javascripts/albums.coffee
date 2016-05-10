# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', '.new_album_button',  (e) ->
  e.preventDefault()
  $.magnificPopup.close();
  $(this).parent('form').submit()
