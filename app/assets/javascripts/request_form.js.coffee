$ ->
  console.log "Listening to input#request_round_trip,input#request_stay_duration change events..."

  # hide Duration of stay field if round trip is not needed
  $("input#request_round_trip").change ->
    console.log "Round Trip checkbox value changed."

    if $(this).is ":checked"
      $(".hide-if-doesnt-request-round-trip").slideDown "slow"
      $("input#request_stay_duration").val ""
    else
      $(".hide-if-doesnt-request-round-trip").slideUp "slow", ->
        $("input#request_stay_duration").val "0"

  # change "hour" to singular form if input=1
  $("input#request_stay_duration").change ->
    console.log "Stay Duration has been changed."

    if '1' == $(this).val()
      $(this).next().text("hour")
    else
      $(this).next().text("hours")
