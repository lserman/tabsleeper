class @Tab
  constructor: (@id) ->

  close: (callback) ->
    @getTab @id, =>
      chrome.tabs.remove @id

  setBadgeText: (text) ->
    @getTab @id, =>
      chrome.browserAction.setBadgeText
        text: text
        tabId: @id

  getTab: (id, callback) ->
    chrome.tabs.get id, ->
      callback() if !chrome.runtime.lastError
