$(document).ready(function() {
  var initiatives = $('#initiatives').length > 0;
  if (initiatives) {
    $(window).scroll(function() {
      var url = $('.pagination .next_page').attr('href');
      if(url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').html("<div class='loader'></div>");
        $.getScript(url)
      }
    });
  }
});
