document.addEventListener 'DOMContentLoaded', ->
  startBtn = document.getElementById 'start'
  console.log 'ContentLoaded'

  chrome.storage.local.get 'hours', (result) ->
    new Dropdown(document, 'hours').set result.hours

  chrome.storage.local.get 'minutes', (result) ->
    new Dropdown(document, 'minutes').set result.minutes

  startBtn.addEventListener 'click', =>
    hours   = new Dropdown(document, 'hours').getAndStoreResult()
    minutes = new Dropdown(document, 'minutes').getAndStoreResult()

    chrome.runtime.sendMessage action: 'startTimer', hours: hours, minutes: minutes

