$(document).ready ->
  users = $('#users').length > 0
  if users
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url and $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text 'Fetching more users...'
        $.getScript url
      return
  return