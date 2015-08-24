class @Dropdown
  constructor: (@document, @id) ->

  set: (value) ->
    @element().value = value

  getAndStoreResult: ->
    value = @value()
    params = {}
    params[@id] = value
    chrome.storage.local.set params
    value

  value: ->
    @selectedOption().value

  selectedOption: ->
    @options()[@element().selectedIndex]

  options: ->
    @element().options

  element: ->
    @document.getElementById(@id)
