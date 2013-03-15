window.PeddieTaxi ||= {}

PeddieTaxi.callbacks = new Array()

PeddieTaxi.register_callback = (name, callback_function) ->
  PeddieTaxi.callbacks[name] ?= []
  PeddieTaxi.callbacks[name].push(callback_function)

PeddieTaxi.do_action = (name, args...) ->
  if PeddieTaxi.callbacks[name]
    callback_function(args) for callback_function in PeddieTaxi.callbacks[name]
