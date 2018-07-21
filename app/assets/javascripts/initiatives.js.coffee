$(document).ready ->
  initiatives = $('#initiatives').length > 0
  if initiatives
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url and $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').html '<div class=\'loader\'></div>'
        $.getScript url
      return
  return