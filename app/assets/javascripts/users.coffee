# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#  $('#crop_avatar').Jcrop(
#    onChange: writeCoordinates,
#    onSelect: writeCoordinates,
#    boxWidth: 300,
#    aspectRatio: 1,
#    minSize: [400, 400],
#    setSelect: [0, 0, 700, 700]
#  )
#
#writeCoordinates = (c)->
#  $('#user_avatar_crop_x').val(c.x)
#  $('#user_avatar_crop_y').val(c.y)
#  $('#user_avatar_crop_width').val(c.w)
#  $('#user_avatar_crop_height').val(c.h)
#
#
#$(document).ready(ready)
#$(document).on('page:load', ready)
#$(document).on('page:change', ready)
#$(document).on('page:update', ready)

#$('form.edit_user').bind 'ajax:success', (e, data, status, xhr) ->
#  user = $.parseJSON(xhr.responseText)
#  console.log('Yes')
#  token = $('meta[name="csrf-token"]').attr('content')
#  $('.test_modal').html(JST["templates/crop_avatar_form"]({user: user,  token: token }))
#.bind 'ajax:error', (e, xhr, status, error) ->
#  errors = $.parseJSON(xhr.responseText)
#  console.log(errors)
#  message =  errors['errors']['name']
#  $('#errors_'+ userSeqId).html(JST["templates/errors"]({message: message}));

#  $('#crop_avatar').Jcrop(
##    onChange: writeCoordinates,
#    onSelect: writeCoordinates,
#    boxWidth: 300,
#    aspectRatio: 1,
#    minSize: [300, 300],
#    setSelect: [0, 0, 300, 300]
#  )

#writeCoordinates = (c)->
#  $('#user_avatar_crop_x').val(c.x)
#  $('#user_avatar_crop_y').val(c.y)
#  $('#user_avatar_crop_width').val(c.w)
#  $('#user_avatar_crop_height').val(c.h)
