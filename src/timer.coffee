class @Timer
  constructor: (@hours, @minutes) ->
    @lengthInMilliseconds = ((@hours * 3600) + (@minutes * 60)) * 1000
    @tab = undefined

  start: ->
    that = this
    @startTime = new Date().getTime()
    chrome.tabs.query { currentWindow: true, active: true }, (tabs) =>
      @tab = new Tab(tabs[0].id)
      @tick()

  tick: ->
    timeRemaining = @getTimeRemainingInMilliseconds()
    @tab.setBadgeText @getBadgeText(timeRemaining) unless @isExpired()

  clear: ->
    chrome.browserAction.setBadgeText text: ''

  stop: ->
    @clear()
    @tab.close()

  isExpired: ->
    @getTimeRemainingInMilliseconds() <= 0

  getTimeRemainingInMilliseconds: ->
    timeElapsed = (new Date().getTime()) - @startTime
    @lengthInMilliseconds - timeElapsed

  getBadgeText: (milliseconds) ->
    console.log milliseconds
    hours = Math.floor(milliseconds / 3600000)
    minutes = @zeroPad (Math.floor((milliseconds % 3600000) / 60000) + 1)
    "#{hours}:#{minutes}"

  zeroPad: (string) ->
    if string.toString().length is 1 then "0#{string}" else string
