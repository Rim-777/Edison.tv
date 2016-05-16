jQuery ->
  setFileUploader()

$(document).on 'click', '.close_progress_modal_button',  (e) ->
  $('.progress_modal_body').html('');
