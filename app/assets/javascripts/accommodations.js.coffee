window.PeddieTaxi ||= {}

PeddieTaxi.register_callback 'map_instantiated', ->
  console.log PeddieTaxi.all_requests

  for requestObj in PeddieTaxi.all_requests
    console.log requestObj.request
    console.log "Adding marker from JavaScript array..."

    latlng = new google.maps.LatLng requestObj.request.venue.latitude, 
                                    requestObj.request.venue.longitude

    marker = new google.maps.Marker {
      position: latlng
      map: PeddieTaxi.map
      title: "#{requestObj.request.venue.street}, #{requestObj.request.venue.city}"
      animation: google.maps.Animation.DROP }