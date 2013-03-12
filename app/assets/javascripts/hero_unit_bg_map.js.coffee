//= require jquery.debouncedresize

# obtain data from page, and generate query string
lat    = $(".hero-unit").data "lat"
lon    = $(".hero-unit").data "lon"
z      = $(".hero-unit").data "z"
w      = $(".hero-unit").data "w"
h      = $(".hero-unit").data "h"
filter = $(".hero-unit").data "filter"
mlat0  = $(".hero-unit").data "mlat0"
mlon0  = $(".hero-unit").data "mlon0"
mico0  = $(".hero-unit").data "mico0"
show   = 1

loadMap = () ->
  console.log "onload/resize detected."

  queryString = $.param {
    lat    : lat
    lon    : lon
    z      : z
    w      : if $(".hero-unit").outerWidth() < 768 then $(".hero-unit").outerWidth() else 1170
    h      : $(".hero-unit").outerHeight()
    filter : filter
    mlat0  : mlat0
    mlon0  : mlon0
    mico0  : mico0
    show   : show }

  mapImageSrc = "http://ojw.dev.openstreetmap.org/StaticMap/?#{queryString}"
  backgroundImage = "url(#{mapImageSrc})"

  if $(".hero-unit").css("background-image") != backgroundImage
    console.log "Loading new image: #{mapImageSrc} ..."
    $(".hero-unit").css "background-image", backgroundImage
  else
    console.log "Old image still fits."


$ => 
  loadMap()

$(window).on "debouncedresize", =>
  loadMap()