window.addEventListener 'load', ->
  initiatives = $('#initiatives').length > 0
  if initiatives
    $(window).scroll ->
      url = $('.pagination .next a').attr('href')
      if url and $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').html "<div class='loader'></div>"
        $.getScript url
      return

  $input = $("[data-behavior='autocomplete']")
  options =
    getValue: 'title'
    url: (phrase) ->
      "/search.json?q=#{phrase}"
    categories: [ {
      listLocation: 'initiatives'
      header: 'Initiatives'
    } ]
    list: onChooseEvent: ->
      url = $input.getSelectedItemData().url
      $input.val ''
      window.location = url
      return
  $input.easyAutocomplete options
  return
