$(document).ready(function() {
  var users = $('#users').length > 0;
  if (users) {
    $(window).scroll(function() {
      var url = $('.pagination .next_page').attr('href');
      if(url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').text('Fetching more users...');
        $.getScript(url)
      }
    });
  }
});