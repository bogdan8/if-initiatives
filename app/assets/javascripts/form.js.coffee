window.addEventListener 'load', ->
  $('#select2').select2
    placeholder: 'Виберіть категорії'
    language: 'uk'

  $('.custom-file-input').on 'change', ->
    $(this).next('.form-control-file').addClass('selected').html $(this).val()
    return
