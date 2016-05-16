$(document).on 'click', '.new_album_button',  (e) ->
  e.preventDefault()
  $.magnificPopup.close();
  $(this).parent('form').submit()

