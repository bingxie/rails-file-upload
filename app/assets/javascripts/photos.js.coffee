# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#new_photo').fileupload
    dataType: "script"
    autoUpload: true
    # add: (e, data) ->
    #   types = /(\.|\/)(gif|jpe?g|png)$/i
    #   file = data.files[0]
    #   if types.test(file.type) || types.test(file.name)
    #     data.context = $(tmpl("template-upload", file))
    #     $('#new_photo').append(data.context)
    #     data.submit()
    #   else
    #     alert("#{file.name} is not a gif, jpeg, or png image file")
    # progress: (e, data) ->
    #   if data.context
    #     progress = parseInt(data.loaded / data.total * 100, 10)
    #     data.context.find('.bar').css('width', progress + '%')