//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require select2
//= require material.min

$(function($) {
  $('#initiative_category_ids').select2({
    placeholder: 'Виберіть категорії',
    language: 'uk'
  })
});
