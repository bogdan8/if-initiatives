//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require cocoon
//= require select2
//= require jquery.easy-autocomplete
//= require material.min
//= require initiatives

$(function($) {
  $('#select2').select2({
    placeholder: 'Виберіть категорії',
    language: 'uk'
  })
});

window.addEventListener("load", function() {
  $input = $("[data-behavior='autocomplete']")

  var options = {
    getValue: "title",
    url: function(phrase) {
      return "/search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: 'initiatives',
        header: "Initiatives",
      }
    ],
    list: {
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url
        $input.val("")
        window.location = (url)
      }
    }
  }

$input.easyAutocomplete(options)
});
