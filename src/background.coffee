chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
  timer = new Timer(request.hours, request.minutes)
  timer.start()

  interval = window.setInterval =>
    timer.tick()

    if timer.isExpired()
      timer.stop()
      window.clearInterval interval

  , 60000


