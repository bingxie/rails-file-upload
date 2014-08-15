# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.upload').find('#new_photo').fileupload
    dataType: "script"
  #   autoUpload: true
  #   acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i
  #   maxFileSize: 1024 * 1024
  #   messages:
  #     maxFileSize: 'File exceeds maximum allowed size of 1MB',

  # $('#new_photo').on 'fileuploadadd', (evt, data) ->
  #   $this = $(this)
  #   validation = data.process ->
  #     $this.fileupload('process', data)

  #   validation.done ->
  #     data.submit()

  #   validation.fail (data) ->
  #     console.log('Upload error: ' + data.files[0].error)

    add: (e, data) ->
      uploadErrors = [];
      types = /(\.|\/)(gif|jpe?g|png)$/i
      file = data.files[0]
      console.log(file)
      if file.type.length && !(types.test(file.type) || types.test(file.name))
        alert('Image file type is not an accepted type.')
        uploadErrors.push('file type error')

      if file.size > 5000000
        alert('Image file size is too big.')
        uploadErrors.push('file size error')

      if uploadErrors.length == 0
        data.context = $(tmpl("template-upload", file))
        $('#new_photo').append(data.context)
        jqXHR = data.submit()
        .error (result, status, jqXHR) ->
          alert(result)

    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')