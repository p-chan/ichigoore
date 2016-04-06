listen = (el, event, handler) ->
  if el.addEventListener
    el.addEventListener event, handler
  else
    el.attachEvent 'on' + event, ->
      handler.call el
      console.log 'Hello'
