# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#new_photo').fileupload
    dataType: "script"
    autoUpload: true
    acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i
    maxFileSize: 1024 * 1024
    messages:
      maxFileSize: 'File exceeds maximum allowed size of 1MB',

  $('#new_photo').on 'fileuploadadd', (evt, data) ->
    $this = $(this)
    validation = data.process ->
      $this.fileupload('process', data)

    validation.done ->
      data.submit()

    validation.fail (data) ->
      console.log('Upload error: ' + data.files[0].error)

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