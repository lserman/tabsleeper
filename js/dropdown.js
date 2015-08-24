// Generated by CoffeeScript 1.6.3
(function() {
  this.Dropdown = (function() {
    function Dropdown(document, id) {
      this.document = document;
      this.id = id;
    }

    Dropdown.prototype.set = function(value) {
      return this.element().value = value;
    };

    Dropdown.prototype.getAndStoreResult = function() {
      var params, value;
      value = this.value();
      params = {};
      params[this.id] = value;
      chrome.storage.local.set(params);
      return value;
    };

    Dropdown.prototype.value = function() {
      return this.selectedOption().value;
    };

    Dropdown.prototype.selectedOption = function() {
      return this.options()[this.element().selectedIndex];
    };

    Dropdown.prototype.options = function() {
      return this.element().options;
    };

    Dropdown.prototype.element = function() {
      return this.document.getElementById(this.id);
    };

    return Dropdown;

  })();

}).call(this);