//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require select2
//= require material.min
//= require initiatives

$(function($) {
  $('#initiative_category_ids').select2({
    placeholder: 'Виберіть категорії',
    language: 'uk'
  })
  $('.file').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.src = file.target.result;
      $('#preview').html(img);
    }
    reader.readAsDataURL(image);
  });
});
