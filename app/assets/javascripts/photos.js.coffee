# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#new_photo').fileupload(
    add: (e, data) ->
      data.context = $('<p/>').text('Uploading...').appendTo(document.body)
      data.submit()
  )