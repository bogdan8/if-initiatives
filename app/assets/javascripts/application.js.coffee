#= require rails-ujs
#= require jquery
#= require jquery_ujs
#= require popper
#= require bootstrap
#= require cocoon
#= require select2
#= require jquery.easy-autocomplete
#= require material.min
#= require initiatives
#= require form

window.addEventListener 'load', ->
  $input = $('[data-behavior=\'autocomplete\']')
  options =
    getValue: 'title'
    url: (phrase) ->
      '/search.json?q=' + phrase
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
