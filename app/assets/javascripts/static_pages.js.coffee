$(document).ready ->

		# ==========================================================================
	#   Scroll To Navigation
	#   ========================================================================== 
	$ ->
	  $("nav ul li a").bind "click", (event) ->
	    $anchor = $(this)
	    $("html, body").stop().animate
	      scrollTop: $($anchor.attr("href")).offset().top
	    , 2000, "easeInOutExpo"
	    event.preventDefault()
	    return

	  return

	$(".ribbon").click (e) ->
	  
	  #e.stopPropagation();
	  $("body,html").animate scrollTop: 0
	  return


	#return false;
	(($) ->
	  
	  ###
	  Copyright 2012, Digital Fusion
	  Licensed under the MIT license.
	  http://teamdf.com/jquery-plugins/license/
	  
	  @author Sam Sehnert
	  @desc A small plugin that checks whether elements are within
	  the user visible viewport of a web browser.
	  only accounts for vertical position, not horizontal.
	  ###
	  $.fn.visible = (partial) ->
	    $t = $(this)
	    $w = $(window)
	    viewTop = $w.scrollTop()
	    viewBottom = viewTop + $w.height()
	    _top = $t.offset().top
	    _bottom = _top + $t.height()
	    compareTop = (if partial is true then _bottom else _top)
	    compareBottom = (if partial is true then _top else _bottom)
	    (compareBottom <= viewBottom) and (compareTop >= viewTop)

	  return
	) jQuery
	$(window).scroll (event) ->
	  $("section").each (i, el) ->
	    el = $(el)
	    el.addClass "animated"  if el.visible(true)
	    return

	  return

	# ==========================================================================
	#   Scroll To Navigation
	#   ========================================================================== 

	# Cache selectors
	lastId = undefined
	topMenu = $("#top-menu")
	topMenuHeight = topMenu.outerHeight() + 35

	# All list items
	menuItems = topMenu.find("a")

	# Anchors corresponding to menu items
	scrollItems = menuItems.map(->
	  item = $($(this).attr("href"))
	  item  if item.length
	)

	# Bind click handler to menu items
	# so we can get a fancy scroll animation
	menuItems.click (e) ->
	  href = $(this).attr("href")
	  offsetTop = (if href is "#" then 0 else $(href).offset().top - topMenuHeight + 2)
	  $("html, body").stop().animate
	    scrollTop: offsetTop
	  , 600
	  e.preventDefault()
	  return


	# Bind to scroll
	$(window).scroll ->
	  
	  # Get container scroll position
	  fromTop = $(this).scrollTop() + topMenuHeight
	  
	  # Get id of current scroll item
	  cur = scrollItems.map(->
	    this  if $(this).offset().top < fromTop
	  )
	  
	  # Get the id of the current element
	  cur = cur[cur.length - 1]
	  id = (if cur and cur.length then cur[0].id else "")
	  if lastId isnt id
	    lastId = id
	    
	    # Set/remove active class
	    menuItems.parent().removeClass("active").end().filter("[href=#" + id + "]").parent().addClass "active"
	  return
