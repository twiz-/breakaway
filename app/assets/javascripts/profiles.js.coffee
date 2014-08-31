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
  
  $("#confirm-dialog").on "show.bs.modal", (e) ->
    url = $(e.relatedTarget).data("url")
    player_name = $(e.relatedTarget).data("player")
    $(e.currentTarget).find(".player_name").html( player_name )
    $(e.currentTarget).find(".confirm").attr('data-url', url);
    console.log($(e.currentTarget).find(".confirm").attr('data-url'))
    return
  
  $("#confirm-dialog").on "click", ".confirm", (e) ->
	  e.preventDefault()
	  $.ajax
      type: 'POST'
      url: $(this).attr("data-url")
      cache: false
    return
    
	
 
