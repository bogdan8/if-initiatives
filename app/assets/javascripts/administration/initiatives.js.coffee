$(document).ready ->
  initiatives = $('#initiatives').length > 0
  if initiatives
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url and $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text 'Fetching more initiatives...'
        $.getScript url
      return
  return