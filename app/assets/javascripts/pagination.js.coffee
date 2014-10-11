jQuery ->
  page_regexp = /\d+$/

  pushPage = (page) ->
    History.pushState null, "Welcome to my world | Page " + page, "?page=" + page
    return

  window.preparePagination = (el) ->
    el.waypoint (direction) ->
      $this = $(this)
      unless $this.hasClass('first-page') && direction is 'up'
        page = parseInt($this.data('page'), 10)
        page -= 1 if direction is 'up'
        page_el = $($('#static-pagination li').get(page))
        unless page_el.hasClass('active')
          $('#static-pagination .active').removeClass('active')
          pushPage(page)
          page_el.addClass('active')
    return

  hash = window.location.hash
  if hash.match(/page=\d+/i)
    window.location.hash = '' # Otherwise the hash will remain after the page reload
    window.location.search = '?page=' + hash.match(/page=(\d+)/i)[1]

  if $('#infinite-scrolling').size() > 0
    preparePagination($('.page-delimiter'))
    $(window).bindWithDelay 'scroll', ->
      more_posts_url = $('#infinite-scrolling .next_page a').attr('href')
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('#infinite-scrolling .pagination').html(
          '<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        $.getScript more_posts_url, ->
          pushPage(more_posts_url.match(page_regexp)[0])
      return
    , 100
return