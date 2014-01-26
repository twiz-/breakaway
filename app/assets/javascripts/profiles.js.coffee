# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $(".fancybox-media").fancybox
    openEffect: "none"
    closeEffect: "none"
    helpers:
      media: {}
	
$(document).ready(ready)


$ ->
  $("#q_clear").click ->
    $(".search-field").val('')