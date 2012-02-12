window.scroll_to_top = (offset=0) ->
  $('html, body').animate
    scrollTop: offset
  , 500

window.scrollify_anchor_links = ->
  $(".pagenav li a").click (event) ->
    event.preventDefault()
    scroll_to_top $(@hash).offset().top if $(@hash).offset()?

# turns "this_string" to "This String"
String::titleize = ->
  @replace /(^|\s|_)([a-z])/g, (m, p1, p2) ->
    p1.replace('_',' ') + p2.replace('_',' ').toUpperCase()
