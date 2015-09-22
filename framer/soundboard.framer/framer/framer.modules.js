require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}],"uisound":[function(require,module,exports){
exports.UISound = (function() {
  function UISound(src) {
    this.src = src;
    this.audio = document.createElement("audio");
    this.audio.setAttribute("webkit-playsinline", "true");
    this.audio.setAttribute("preload", "auto");
    this.audio.src = this.src;
  }

  UISound.prototype.stop = function() {
    this.audio.pause();
    return this.audio.currentTime = 0;
  };

  UISound.prototype.play = function() {
    this.stop();
    return this.audio.play();
  };

  return UISound;

})();


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset:utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyaWZ5L25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCIvVXNlcnMvZWRvdWFyZHVyY2FkZXovRGVza3RvcC9zb3VuZGJvYXJkLmZyYW1lci9tb2R1bGVzL215TW9kdWxlLmNvZmZlZSIsIi9Vc2Vycy9lZG91YXJkdXJjYWRlei9EZXNrdG9wL3NvdW5kYm9hcmQuZnJhbWVyL21vZHVsZXMvdWlzb3VuZC5jb2ZmZWUiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7QUNJQSxPQUFPLENBQUMsS0FBUixHQUFnQjs7QUFFaEIsT0FBTyxDQUFDLFVBQVIsR0FBcUIsU0FBQTtTQUNwQixLQUFBLENBQU0sdUJBQU47QUFEb0I7O0FBR3JCLE9BQU8sQ0FBQyxPQUFSLEdBQWtCLENBQUMsQ0FBRCxFQUFJLENBQUosRUFBTyxDQUFQOzs7O0FDVFosT0FBTyxDQUFDO0VBQ0csaUJBQUMsR0FBRDtJQUFDLElBQUMsQ0FBQSxNQUFEO0lBQ1YsSUFBQyxDQUFBLEtBQUQsR0FBUyxRQUFRLENBQUMsYUFBVCxDQUF1QixPQUF2QjtJQUNULElBQUMsQ0FBQSxLQUFLLENBQUMsWUFBUCxDQUFvQixvQkFBcEIsRUFBMEMsTUFBMUM7SUFDQSxJQUFDLENBQUEsS0FBSyxDQUFDLFlBQVAsQ0FBb0IsU0FBcEIsRUFBK0IsTUFBL0I7SUFDQSxJQUFDLENBQUEsS0FBSyxDQUFDLEdBQVAsR0FBYSxJQUFDLENBQUE7RUFKTDs7b0JBTWIsSUFBQSxHQUFNLFNBQUE7SUFDRixJQUFDLENBQUEsS0FBSyxDQUFDLEtBQVAsQ0FBQTtXQUNBLElBQUMsQ0FBQSxLQUFLLENBQUMsV0FBUCxHQUFxQjtFQUZuQjs7b0JBR04sSUFBQSxHQUFNLFNBQUE7SUFDRixJQUFDLENBQUEsSUFBRCxDQUFBO1dBQ0EsSUFBQyxDQUFBLEtBQUssQ0FBQyxJQUFQLENBQUE7RUFGRSIsImZpbGUiOiJnZW5lcmF0ZWQuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlc0NvbnRlbnQiOlsiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt2YXIgZj1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpO3Rocm93IGYuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixmfXZhciBsPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChsLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGwsbC5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVybiBzfSkiLCIjIEFkZCB0aGUgZm9sbG93aW5nIGxpbmUgdG8geW91ciBwcm9qZWN0IGluIEZyYW1lciBTdHVkaW8uIFxuIyBteU1vZHVsZSA9IHJlcXVpcmUgXCJteU1vZHVsZVwiXG4jIFJlZmVyZW5jZSB0aGUgY29udGVudHMgYnkgbmFtZSwgbGlrZSBteU1vZHVsZS5teUZ1bmN0aW9uKCkgb3IgbXlNb2R1bGUubXlWYXJcblxuZXhwb3J0cy5teVZhciA9IFwibXlWYXJpYWJsZVwiXG5cbmV4cG9ydHMubXlGdW5jdGlvbiA9IC0+XG5cdHByaW50IFwibXlGdW5jdGlvbiBpcyBydW5uaW5nXCJcblxuZXhwb3J0cy5teUFycmF5ID0gWzEsIDIsIDNdIiwiY2xhc3MgZXhwb3J0cy5VSVNvdW5kXG4gICAgY29uc3RydWN0b3I6IChAc3JjKSAtPlxuICAgICAgICBAYXVkaW8gPSBkb2N1bWVudC5jcmVhdGVFbGVtZW50KFwiYXVkaW9cIilcbiAgICAgICAgQGF1ZGlvLnNldEF0dHJpYnV0ZShcIndlYmtpdC1wbGF5c2lubGluZVwiLCBcInRydWVcIilcbiAgICAgICAgQGF1ZGlvLnNldEF0dHJpYnV0ZShcInByZWxvYWRcIiwgXCJhdXRvXCIpXG4gICAgICAgIEBhdWRpby5zcmMgPSBAc3JjXG4gICAgICAgIFxuICAgIHN0b3A6IC0+XG4gICAgICAgIEBhdWRpby5wYXVzZSgpXG4gICAgICAgIEBhdWRpby5jdXJyZW50VGltZSA9IDBcbiAgICBwbGF5OiAtPlxuICAgICAgICBAc3RvcCgpXG4gICAgICAgIEBhdWRpby5wbGF5KCkiXX0=
