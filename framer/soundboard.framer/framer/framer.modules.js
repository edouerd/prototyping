require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}],"tabs":[function(require,module,exports){

/*
	tabBarModule
	–
	Created by Petter Nilsson
	http://petter.pro
 */
var defaults, getItemFromName, setBadgeValue, setSelected, updateViews;

defaults = {
  screenWidth: Screen.width,
  screenHeight: Screen.height,
  barHeight: 98,
  labelOffset: -28,
  iconOffset: -12,
  tintColor: "#007aff",
  tintColorUnselected: "#929292",
  blur: 40,
  opacity: 0.75,
  borderShadow: "0px -1px 0px 0px rgba(0,0,0,0.32)",
  backgroundColor: "#f8f8f8",
  showLabels: true,
  badgeSize: 36,
  badgeColor: "#FF3B30"
};

defaults.labelTextStyle = {
  fontSize: "20px",
  textAlign: "center",
  fontFamily: "Helvetica Neue', sans-serif"
};

defaults.badgeTextStyle = {
  fontSize: "26px",
  lineHeight: "36px",
  color: "#fff",
  textAlign: "center",
  fontFamily: "Helvetica Neue', sans-serif"
};

exports.defaults = defaults;

getItemFromName = function(name) {
  var item, j, len, ref;
  ref = this.items;
  for (j = 0, len = ref.length; j < len; j++) {
    item = ref[j];
    if (item.name === name) {
      return item;
    }
  }
};

updateViews = function(selectedItem) {
  var item, j, len, ref, results;
  ref = this.items;
  results = [];
  for (j = 0, len = ref.length; j < len; j++) {
    item = ref[j];
    if (item.view != null) {
      if (item.view === selectedItem.view) {
        item.view.visible = true;
      } else {
        item.view.visible = false;
      }
      if (item.blurView === selectedItem.blurView) {
        results.push(item.blurView.visible = true);
      } else {
        results.push(item.blurView.visible = false);
      }
    } else {
      results.push(void 0);
    }
  }
  return results;
};

setSelected = function(name) {
  var item, j, len, ref, results;
  if (name !== this.selected) {
    ref = this.items;
    results = [];
    for (j = 0, len = ref.length; j < len; j++) {
      item = ref[j];
      if (item.name === name) {
        item.iconLayer.backgroundColor = defaults.tintColor;
        if (item.labelLayer) {
          item.labelLayer.style = {
            "color": defaults.tintColor
          };
        }
        if (item.iconLayer.selectedIcon) {
          item.iconLayer.style = {
            "-webkit-mask-image": "url(" + item.iconLayer.selectedIcon + ")"
          };
        }
        this.selected = item.name;
        this.updateViews(item);
        results.push(this.emit("tabBarDidSwitch", item.name));
      } else {
        item.iconLayer.backgroundColor = defaults.tintColorUnselected;
        if (item.labelLayer) {
          item.labelLayer.style = {
            "color": defaults.tintColorUnselected
          };
        }
        if (item.iconLayer.selectedIcon) {
          results.push(item.iconLayer.style = {
            "-webkit-mask-image": "url(" + item.iconLayer.icon + ")"
          });
        } else {
          results.push(void 0);
        }
      }
    }
    return results;
  }
};

setBadgeValue = function(name, value) {
  var item, j, len, ref, results;
  ref = this.items;
  results = [];
  for (j = 0, len = ref.length; j < len; j++) {
    item = ref[j];
    if (item.name === name) {
      if (value) {
        item.badgeLayer.html = value;
        results.push(item.badgeLayer.visible = true);
      } else {
        results.push(item.badgeLayer.visible = false);
      }
    } else {
      results.push(void 0);
    }
  }
  return results;
};

exports.tabBar = function(barItems) {
  var background, badgeLayer, blurView, i, iconLayer, itemCount, itemLayer, labelLayer, name, params, tabBar;
  tabBar = new Layer({
    x: 0,
    y: defaults.screenHeight - defaults.barHeight,
    width: defaults.screenWidth,
    height: defaults.barHeight,
    backgroundColor: defaults.backgroundColor
  });
  tabBar.style = {
    "box-shadow": defaults.borderShadow
  };
  tabBar.getItemFromName = getItemFromName;
  tabBar.updateViews = updateViews;
  tabBar.setSelected = setSelected;
  tabBar.setBadgeValue = setBadgeValue;
  tabBar.selected = null;
  tabBar.items = [];
  background = new Layer({
    x: 0,
    y: 0,
    width: defaults.screenWidth,
    height: defaults.barHeight,
    backgroundColor: defaults.backgroundColor,
    opacity: defaults.opacity,
    superLayer: tabBar
  });
  itemCount = Object.keys(barItems).length;
  i = 0;
  for (name in barItems) {
    params = barItems[name];
    itemLayer = new Layer({
      backgroundColor: "none",
      width: defaults.screenWidth / itemCount,
      height: defaults.barHeight,
      x: i * (defaults.screenWidth / itemCount),
      y: 0,
      superLayer: tabBar,
      name: name
    });
    if (params.view != null) {
      blurView = params.view.copy();
      if (ScrollComponent.prototype.isPrototypeOf(blurView)) {
        blurView.content.blur = defaults.blur;
      } else {
        blurView.blur = defaults.blur;
      }
      blurView.superLayer = tabBar;
      blurView.index = 0;
      blurView.y = blurView.y - (defaults.screenHeight - defaults.barHeight);
      itemLayer.view = params.view;
      itemLayer.blurView = blurView;
    }
    iconLayer = new Layer({
      width: 60,
      height: 60,
      superLayer: itemLayer
    });
    iconLayer.icon = params.icon;
    if (params.selectedIcon != null) {
      iconLayer.selectedIcon = params.selectedIcon;
    }
    iconLayer.style = {
      "-webkit-mask-image": "url(" + iconLayer.icon + ")",
      "-webkit-mask-repeat": "no-repeat",
      "-webkit-mask-position": "center center"
    };
    iconLayer.centerX();
    iconLayer.centerY(defaults.iconOffset);
    itemLayer.iconLayer = iconLayer;
    if (defaults.showLabels) {
      labelLayer = new Layer({
        width: itemLayer.width,
        x: 0,
        y: defaults.barHeight + defaults.labelOffset,
        superLayer: itemLayer,
        backgroundColor: "none"
      });
      labelLayer.html = name;
      labelLayer.style = defaults.labelTextStyle;
      itemLayer.labelLayer = labelLayer;
    }
    badgeLayer = new Layer({
      width: defaults.badgeSize,
      height: defaults.badgeSize,
      x: 0,
      y: 6,
      borderRadius: 18,
      superLayer: itemLayer,
      backgroundColor: defaults.badgeColor
    });
    badgeLayer.style = defaults.badgeTextStyle;
    badgeLayer.centerX(26);
    itemLayer.badgeLayer = badgeLayer;
    itemLayer.badgeLayer.visible = false;
    tabBar.items.push(itemLayer);
    itemLayer.on(Events.Click, function() {
      return tabBar.setSelected(this.name);
    });
    i++;
  }
  tabBar.setSelected(tabBar.items[0].name);
  return tabBar;
};


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
//# sourceMappingURL=data:application/json;charset:utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyaWZ5L25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCIvVXNlcnMvZWRvdWFyZC9Qcm9qZWN0cy9lZC9wcm9qZWN0cy9wcm90b3R5cGluZy9mcmFtZXIvc291bmRib2FyZC5mcmFtZXIvbW9kdWxlcy9teU1vZHVsZS5jb2ZmZWUiLCIvVXNlcnMvZWRvdWFyZC9Qcm9qZWN0cy9lZC9wcm9qZWN0cy9wcm90b3R5cGluZy9mcmFtZXIvc291bmRib2FyZC5mcmFtZXIvbW9kdWxlcy90YWJzLmNvZmZlZSIsIi9Vc2Vycy9lZG91YXJkL1Byb2plY3RzL2VkL3Byb2plY3RzL3Byb3RvdHlwaW5nL2ZyYW1lci9zb3VuZGJvYXJkLmZyYW1lci9tb2R1bGVzL3Vpc291bmQuY29mZmVlIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FDSUEsT0FBTyxDQUFDLEtBQVIsR0FBZ0I7O0FBRWhCLE9BQU8sQ0FBQyxVQUFSLEdBQXFCLFNBQUE7U0FDcEIsS0FBQSxDQUFNLHVCQUFOO0FBRG9COztBQUdyQixPQUFPLENBQUMsT0FBUixHQUFrQixDQUFDLENBQUQsRUFBSSxDQUFKLEVBQU8sQ0FBUDs7Ozs7QUNUbEI7Ozs7OztBQUFBLElBQUE7O0FBUUEsUUFBQSxHQUFXO0VBQ1YsV0FBQSxFQUFhLE1BQU0sQ0FBQyxLQURWO0VBRVYsWUFBQSxFQUFjLE1BQU0sQ0FBQyxNQUZYO0VBR1YsU0FBQSxFQUFXLEVBSEQ7RUFJVixXQUFBLEVBQWEsQ0FBQyxFQUpKO0VBS1YsVUFBQSxFQUFZLENBQUMsRUFMSDtFQU1WLFNBQUEsRUFBVyxTQU5EO0VBT1YsbUJBQUEsRUFBcUIsU0FQWDtFQVFWLElBQUEsRUFBTSxFQVJJO0VBU1YsT0FBQSxFQUFTLElBVEM7RUFVVixZQUFBLEVBQWMsbUNBVko7RUFXVixlQUFBLEVBQWlCLFNBWFA7RUFZVixVQUFBLEVBQVksSUFaRjtFQWFWLFNBQUEsRUFBVyxFQWJEO0VBY1YsVUFBQSxF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RS9CLE1BQU0sQ0FBQyxLQUFLLENBQUMsSUFBYixDQUFrQixTQUFsQjtJQUVBLFNBQVMsQ0FBQyxFQUFWLENBQWEsTUFBTSxDQUFDLEtBQXBCLEVBQTJCLFNBQUE7YUFDMUIsTUFBTSxDQUFDLFdBQVAsQ0FBbUIsSUFBQyxDQUFBLElBQXBCO0lBRDBCLENBQTNCO0lBR0EsQ0FBQTtBQXRFRDtFQXlFQSxNQUFNLENBQUMsV0FBUCxDQUFtQixNQUFNLENBQUMsS0FBTSxDQUFBLENBQUEsQ0FBRSxDQUFDLElBQW5DO0FBRUEsU0FBTztBQXpHUzs7OztBQ3JGWCxPQUFPLENBQUM7RUFDRyxpQkFBQyxHQUFEO0lBQUMsSUFBQyxDQUFBLE1BQUQ7SUFDVixJQUFDLENBQUEsS0FBRCxHQUFTLFFBQVEsQ0FBQyxhQUFULENBQXVCLE9BQXZCO0lBQ1QsSUFBQyxDQUFBLEtBQUssQ0FBQyxZQUFQLENBQW9CLG9CQUFwQixFQUEwQyxNQUExQztJQUNBLElBQUMsQ0FBQSxLQUFLLENBQUMsWUFBUCxDQUFvQixTQUFwQixFQUErQixNQUEvQjtJQUNBLElBQUMsQ0FBQSxLQUFLLENBQUMsR0FBUCxHQUFhLElBQUMsQ0FBQTtFQUpMOztvQkFNYixJQUFBLEdBQU0sU0FBQTtJQUNGLElBQUMsQ0FBQSxLQUFLLENBQUMsS0FBUCxDQUFBO1dBQ0EsSUFBQyxDQUFBLEtBQUssQ0FBQyxXQUFQLEdBQXFCO0VBRm5COztvQkFHTixJQUFBLEdBQU0sU0FBQTtJQUNGLElBQUMsQ0FBQSxJQUFELENBQUE7V0FDQSxJQUFDLENBQUEsS0FBSyxDQUFDLElBQVAsQ0FBQTtFQUZFIiwiZmlsZSI6ImdlbmVyYXRlZC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzQ29udGVudCI6WyIoZnVuY3Rpb24gZSh0LG4scil7ZnVuY3Rpb24gcyhvLHUpe2lmKCFuW29dKXtpZighdFtvXSl7dmFyIGE9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtpZighdSYmYSlyZXR1cm4gYShvLCEwKTtpZihpKXJldHVybiBpKG8sITApO3ZhciBmPW5ldyBFcnJvcihcIkNhbm5vdCBmaW5kIG1vZHVsZSAnXCIrbytcIidcIik7dGhyb3cgZi5jb2RlPVwiTU9EVUxFX05PVF9GT1VORFwiLGZ9dmFyIGw9bltvXT17ZXhwb3J0czp7fX07dFtvXVswXS5jYWxsKGwuZXhwb3J0cyxmdW5jdGlvbihlKXt2YXIgbj10W29dWzFdW2VdO3JldHVybiBzKG4/bjplKX0sbCxsLmV4cG9ydHMsZSx0LG4scil9cmV0dXJuIG5bb10uZXhwb3J0c312YXIgaT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2Zvcih2YXIgbz0wO288ci5sZW5ndGg7bysrKXMocltvXSk7cmV0dXJuIHN9KSIsIiMgQWRkIHRoZSBmb2xsb3dpbmcgbGluZSB0byB5b3VyIHByb2plY3QgaW4gRnJhbWVyIFN0dWRpby4gXG4jIG15TW9kdWxlID0gcmVxdWlyZSBcIm15TW9kdWxlXCJcbiMgUmVmZXJlbmNlIHRoZSBjb250ZW50cyBieSBuYW1lLCBsaWtlIG15TW9kdWxlLm15RnVuY3Rpb24oKSBvciBteU1vZHVsZS5teVZhclxuXG5leHBvcnRzLm15VmFyID0gXCJteVZhcmlhYmxlXCJcblxuZXhwb3J0cy5teUZ1bmN0aW9uID0gLT5cblx0cHJpbnQgXCJteUZ1bmN0aW9uIGlzIHJ1bm5pbmdcIlxuXG5leHBvcnRzLm15QXJyYXkgPSBbMSwgMiwgM10iLCIjIyNcblx0dGFiQmFyTW9kdWxlXG5cdOKAk1xuXHRDcmVhdGVkIGJ5IFBldHRlciBOaWxzc29uXG5cdGh0dHA6Ly9wZXR0ZXIucHJvXG4jIyNcblxuIyBEZWZhdWx0IHN0eWxlc1xuZGVmYXVsdHMgPSB7XG5cdHNjcmVlbldpZHRoOiBTY3JlZW4ud2lkdGhcblx0c2NyZWVuSGVpZ2h0OiBTY3JlZW4uaGVpZ2h0XG5cdGJhckhlaWdodDogOThcblx0bGFiZWxPZmZzZXQ6IC0yOFxuXHRpY29uT2Zmc2V0OiAtMTJcblx0dGludENvbG9yOiBcIiMwMDdhZmZcIlxuXHR0aW50Q29sb3JVbnNlbGVjdGVkOiBcIiM5MjkyOTJcIlxuXHRibHVyOiA0MFxuXHRvcGFjaXR5OiAwLjc1XG5cdGJvcmRlclNoYWRvdzogXCIwcHggLTFweCAwcHggMHB4IHJnYmEoMCwwLDAsMC4zMilcIlxuXHRiYWNrZ3JvdW5kQ29sb3I6IFwiI2Y4ZjhmOFwiXG5cdHNob3dMYWJlbHM6IHRydWVcblx0YmFkZ2VTaXplOiAzNlxuXHRiYWRnZUNvbG9yOiBcIiNGRjNCMzBcIlxufVxuZGVmYXVsdHMubGFiZWxUZXh0U3R5bGUgPSB7XG5cdGZvbnRTaXplOiBcIjIwcHhcIlxuXHR0ZXh0QWxpZ246IFwiY2VudGVyXCJcblx0Zm9udEZhbWlseTogXCJIZWx2ZXRpY2EgTmV1ZScsIHNhbnMtc2VyaWZcIlxufVxuZGVmYXVsdHMuYmFkZ2VUZXh0U3R5bGUgPSB7XG5cdGZvbnRTaXplOiBcIjI2cHhcIlxuXHRsaW5lSGVpZ2h0OiBcIjM2cHhcIlxuXHRjb2xvcjogXCIjZmZmXCJcblx0dGV4dEFsaWduOiBcImNlbnRlclwiXG5cdGZvbnRGYW1pbHk6IFwiSGVsdmV0aWNhIE5ldWUnLCBzYW5zLXNlcmlmXCJcbn1cbmV4cG9ydHMuZGVmYXVsdHMgPSBkZWZhdWx0c1xuXG5cbmdldEl0ZW1Gcm9tTmFtZSA9IChuYW1lKSAtPlxuXHQjIFJldHVybnMgYSB0YWIgYmFyIGl0ZW0gaWYgbmFtZXMgbWF0Y2hlc1xuXG5cdGZvciBpdGVtIGluIEBpdGVtc1xuXHRcdHJldHVybiBpdGVtIGlmIGl0ZW0ubmFtZSBpcyBuYW1lXG5cblxudXBkYXRlVmlld3MgPSAoc2VsZWN0ZWRJdGVtKSAtPlxuXHQjIFNob3dzL2hpZGVzIHZpZXdzIGJhc2VkIG9uIHNlbGVjdGVkIHRhYiBiYXIgaXRlbVxuXG5cdGZvciBpdGVtIGluIEBpdGVtc1xuXHRcdGlmIGl0ZW0udmlldz9cblx0XHRcdGlmIGl0ZW0udmlldyBpcyBzZWxlY3RlZEl0ZW0udmlldyB0aGVuIGl0ZW0udmlldy52aXNpYmxlID0gdHJ1ZSBlbHNlIGl0ZW0udmlldy52aXNpYmxlID0gZmFsc2Vcblx0XHRcdGlmIGl0ZW0uYmx1clZpZXcgaXMgc2VsZWN0ZWRJdGVtLmJsdXJWaWV3IHRoZW4gaXRlbS5ibHVyVmlldy52aXNpYmxlID0gdHJ1ZSBlbHNlIGl0ZW0uYmx1clZpZXcudmlzaWJsZSA9IGZhbHNlXG5cblxuc2V0U2VsZWN0ZWQgPSAobmFtZSkgLT5cblx0IyBTZXRzIHNlbGVjdGVkIHRhYiBpdGVtIGZyb20gdGhlIGtleSAobmFtZSkgdXNlZCB3aGVuIGNyZWF0aW5nIGl0XG5cblx0aWYgbmFtZSAhPSBAc2VsZWN0ZWRcblx0XHRmb3IgaXRlbSBpbiBAaXRlbXNcblx0XHRcdGlmIGl0ZW0ubmFtZSBpcyBuYW1lXG5cdFx0XHRcdGl0ZW0uaWNvbkxheWVyLmJhY2tncm91bmRDb2xvciA9IGRlZmF1bHRzLnRpbnRDb2xvclxuXHRcdFx0XHRpdGVtLmxhYmVsTGF5ZXIuc3R5bGUgPSBcImNvbG9yXCI6IGRlZmF1bHRzLnRpbnRDb2xvciBpZiBpdGVtLmxhYmVsTGF5ZXJcblx0XHRcdFx0aXRlbS5pY29uTGF5ZXIuc3R5bGUgPSBcIi13ZWJraXQtbWFzay1pbWFnZVwiOiBcInVybChcIiArIGl0ZW0uaWNvbkxheWVyLnNlbGVjdGVkSWNvbiArIFwiKVwiIGlmIGl0ZW0uaWNvbkxheWVyLnNlbGVjdGVkSWNvblxuXHRcdFx0XHRAc2VsZWN0ZWQgPSBpdGVtLm5hbWVcblx0XHRcdFx0QHVwZGF0ZVZpZXdzKGl0ZW0pXG5cdFx0XHRcdEAuZW1pdChcInRhYkJhckRpZFN3aXRjaFwiLCBpdGVtLm5hbWUpXG5cdFx0XHRlbHNlXG5cdFx0XHRcdGl0ZW0uaWNvbkxheWVyLmJhY2tncm91bmRDb2xvciA9IGRlZmF1bHRzLnRpbnRDb2xvclVuc2VsZWN0ZWRcblx0XHRcdFx0aXRlbS5sYWJlbExheWVyLnN0eWxlID0gXCJjb2xvclwiOiBkZWZhdWx0cy50aW50Q29sb3JVbnNlbGVjdGVkIGlmIGl0ZW0ubGFiZWxMYXllclxuXHRcdFx0XHRpdGVtLmljb25MYXllci5zdHlsZSA9IFwiLXdlYmtpdC1tYXNrLWltYWdlXCI6IFwidXJsKFwiICsgaXRlbS5pY29uTGF5ZXIuaWNvbiArIFwiKVwiIGlmIGl0ZW0uaWNvbkxheWVyLnNlbGVjdGVkSWNvblxuXG5cbnNldEJhZGdlVmFsdWUgPSAobmFtZSwgdmFsdWUpIC0+XG5cdCMgQWRkcyBhIGJhZGdlIHRvIHRoZSB0YWIgaXRlbSBpZiB2YWx1ZSBpcyBhIG51bWJlciA+IDAgYW5kIHJlbW92ZXMgdGhlIGJhZGdlIGlmIG51bGxcblxuXHRmb3IgaXRlbSBpbiBAaXRlbXNcblx0XHRpZiBpdGVtLm5hbWUgaXMgbmFtZVxuXHRcdFx0aWYgdmFsdWVcblx0XHRcdFx0aXRlbS5iYWRnZUxheWVyLmh0bWwgPSB2YWx1ZVxuXHRcdFx0XHRpdGVtLmJhZGdlTGF5ZXIudmlzaWJsZSA9IHRydWVcblx0XHRcdGVsc2Vcblx0XHRcdFx0aXRlbS5iYWRnZUxheWVyLnZpc2libGUgPSBmYWxzZVxuXG5cbmV4cG9ydHMudGFiQmFyID0gKGJhckl0ZW1zKSAtPlxuXHQjIENyZWF0ZXMgYW5kIHNldC11cHMgdGhlIHRhYiBiYXJcblxuXHR0YWJCYXIgPSBuZXcgTGF5ZXJcblx0XHR4OiAwXG5cdFx0eTogZGVmYXVsdHMuc2NyZWVuSGVpZ2h0IC0gZGVmYXVsdHMuYmFySGVpZ2h0XG5cdFx0d2lkdGg6IGRlZmF1bHRzLnNjcmVlbldpZHRoXG5cdFx0aGVpZ2h0OiBkZWZhdWx0cy5iYXJIZWlnaHRcblx0XHRiYWNrZ3JvdW5kQ29sb3I6IGRlZmF1bHRzLmJhY2tncm91bmRDb2xvclxuXG5cdHRhYkJhci5zdHlsZSA9IFwiYm94LXNoYWRvd1wiOiBkZWZhdWx0cy5ib3JkZXJTaGFkb3dcblx0dGFiQmFyLmdldEl0ZW1Gcm9tTmFtZSA9IGdldEl0ZW1Gcm9tTmFtZVxuXHR0YWJCYXIudXBkYXRlVmlld3MgPSB1cGRhdGVWaWV3c1xuXHR0YWJCYXIuc2V0U2VsZWN0ZWQgPSBzZXRTZWxlY3RlZFxuXHR0YWJCYXIuc2V0QmFkZ2VWYWx1ZSA9IHNldEJhZGdlVmFsdWVcblx0dGFiQmFyLnNlbGVjdGVkID0gbnVsbFxuXHR0YWJCYXIuaXRlbXMgPSBbXVxuXG5cdGJhY2tncm91bmQgPSBuZXcgTGF5ZXJcblx0XHR4OiAwXG5cdFx0eTogMFxuXHRcdHdpZHRoOiBkZWZhdWx0cy5zY3JlZW5XaWR0aFxuXHRcdGhlaWdodDogZGVmYXVsdHMuYmFySGVpZ2h0XG5cdFx0YmFja2dyb3VuZENvbG9yOiBkZWZhdWx0cy5iYWNrZ3JvdW5kQ29sb3Jcblx0XHRvcGFjaXR5OiBkZWZhdWx0cy5vcGFjaXR5XG5cdFx0c3VwZXJMYXllcjogdGFiQmFyXG5cblx0aXRlbUNvdW50ID0gT2JqZWN0LmtleXMoYmFySXRlbXMpLmxlbmd0aFxuXHRpID0gMFxuXG5cdGZvciBuYW1lLHBhcmFtcyBvZiBiYXJJdGVtc1xuXHRcdGl0ZW1MYXllciA9IG5ldyBMYXllclxuXHRcdFx0YmFja2dyb3VuZENvbG9yOiBcIm5vbmVcIlxuXHRcdFx0d2lkdGg6IGRlZmF1bHRzLnNjcmVlbldpZHRoIC8gaXRlbUNvdW50XG5cdFx0XHRoZWlnaHQ6IGRlZmF1bHRzLmJhckhlaWdodFxuXHRcdFx0eDogaSAqIChkZWZhdWx0cy5zY3JlZW5XaWR0aCAvIGl0ZW1Db3VudClcblx0XHRcdHk6IDBcblx0XHRcdHN1cGVyTGF5ZXI6IHRhYkJhclxuXHRcdFx0bmFtZTogbmFtZVxuXG5cdFx0aWYgcGFyYW1zLnZpZXc/XG5cdFx0XHQjIENyZWF0ZSBhIGNvcHkgb2YgdGhlIHZpZXcsIGJsdXIgaXQgYW5kIHVzZSBpdCBhcyBhIGJhY2tncm91bmRcblx0XHRcdGJsdXJWaWV3ID0gcGFyYW1zLnZpZXcuY29weSgpXG5cdFx0XHRpZiBTY3JvbGxDb21wb25lbnQucHJvdG90eXBlLmlzUHJvdG90eXBlT2YoYmx1clZpZXcpXG5cdFx0XHRcdGJsdXJWaWV3LmNvbnRlbnQuYmx1ciA9IGRlZmF1bHRzLmJsdXJcblx0XHRcdGVsc2Vcblx0XHRcdFx0Ymx1clZpZXcuYmx1ciA9IGRlZmF1bHRzLmJsdXJcblx0XHRcdGJsdXJWaWV3LnN1cGVyTGF5ZXIgPSB0YWJCYXJcblx0XHRcdGJsdXJWaWV3LmluZGV4ID0gMFxuXHRcdFx0Ymx1clZpZXcueSA9IGJsdXJWaWV3LnkgLSAoZGVmYXVsdHMuc2NyZWVuSGVpZ2h0IC0gZGVmYXVsdHMuYmFySGVpZ2h0KVxuXG5cdFx0XHRpdGVtTGF5ZXIudmlldyA9IHBhcmFtcy52aWV3XG5cdFx0XHRpdGVtTGF5ZXIuYmx1clZpZXcgPSBibHVyVmlld1xuXG5cdFx0aWNvbkxheWVyID0gbmV3IExheWVyXG5cdFx0XHR3aWR0aDogNjBcblx0XHRcdGhlaWdodDogNjBcblx0XHRcdHN1cGVyTGF5ZXI6IGl0ZW1MYXllclxuXHRcdGljb25MYXllci5pY29uID0gcGFyYW1zLmljb25cblx0XHRpY29uTGF5ZXIuc2VsZWN0ZWRJY29uID0gcGFyYW1zLnNlbGVjdGVkSWNvbiBpZiBwYXJhbXMuc2VsZWN0ZWRJY29uP1xuXG5cdFx0IyBUaGlzIGJsYWNrIG1hZ2ljIGlzIHVzZWQgdG8gdGludCB0aGUgUE5HIGltYWdlcy4gT25seSB3b3JrcyBvbiB3ZWJraXQgYnJvd3NlcnMgOi9cblx0XHRpY29uTGF5ZXIuc3R5bGUgPVxuXHRcdFx0XCItd2Via2l0LW1hc2staW1hZ2VcIjogXCJ1cmwoXCIgKyBpY29uTGF5ZXIuaWNvbiArIFwiKVwiXG5cdFx0XHRcIi13ZWJraXQtbWFzay1yZXBlYXRcIjogXCJuby1yZXBlYXRcIlxuXHRcdFx0XCItd2Via2l0LW1hc2stcG9zaXRpb25cIjogXCJjZW50ZXIgY2VudGVyXCJcblx0XHRpY29uTGF5ZXIuY2VudGVyWCgpXG5cdFx0aWNvbkxheWVyLmNlbnRlclkoZGVmYXVsdHMuaWNvbk9mZnNldClcblx0XHRpdGVtTGF5ZXIuaWNvbkxheWVyID0gaWNvbkxheWVyXG5cblx0XHRpZiBkZWZhdWx0cy5zaG93TGFiZWxzXG5cdFx0XHRsYWJlbExheWVyID0gbmV3IExheWVyXG5cdFx0XHRcdHdpZHRoOiBpdGVtTGF5ZXIud2lkdGhcblx0XHRcdFx0eDogMFxuXHRcdFx0XHR5OiBkZWZhdWx0cy5iYXJIZWlnaHQgKyBkZWZhdWx0cy5sYWJlbE9mZnNldFxuXHRcdFx0XHRzdXBlckxheWVyOiBpdGVtTGF5ZXJcblx0XHRcdFx0YmFja2dyb3VuZENvbG9yOiBcIm5vbmVcIlxuXHRcdFx0bGFiZWxMYXllci5odG1sID0gbmFtZVxuXHRcdFx0bGFiZWxMYXllci5zdHlsZSA9IGRlZmF1bHRzLmxhYmVsVGV4dFN0eWxlXG5cdFx0XHRpdGVtTGF5ZXIubGFiZWxMYXllciA9IGxhYmVsTGF5ZXJcblxuXHRcdGJhZGdlTGF5ZXIgPSBuZXcgTGF5ZXJcblx0XHRcdHdpZHRoOiBkZWZhdWx0cy5iYWRnZVNpemVcblx0XHRcdGhlaWdodDogZGVmYXVsdHMuYmFkZ2VTaXplXG5cdFx0XHR4OiAwXG5cdFx0XHR5OiA2XG5cdFx0XHRib3JkZXJSYWRpdXM6IDE4XG5cdFx0XHRzdXBlckxheWVyOiBpdGVtTGF5ZXJcblx0XHRcdGJhY2tncm91bmRDb2xvcjogZGVmYXVsdHMuYmFkZ2VDb2xvclxuXHRcdGJhZGdlTGF5ZXIuc3R5bGUgPSBkZWZhdWx0cy5iYWRnZVRleHRTdHlsZVxuXHRcdGJhZGdlTGF5ZXIuY2VudGVyWCgyNilcblxuXHRcdGl0ZW1MYXllci5iYWRnZUxheWVyID0gYmFkZ2VMYXllclxuXHRcdGl0ZW1MYXllci5iYWRnZUxheWVyLnZpc2libGUgPSBmYWxzZVxuXG5cdFx0dGFiQmFyLml0ZW1zLnB1c2goaXRlbUxheWVyKVxuXG5cdFx0aXRlbUxheWVyLm9uIEV2ZW50cy5DbGljaywgLT5cblx0XHRcdHRhYkJhci5zZXRTZWxlY3RlZChAbmFtZSlcblxuXHRcdGkrK1xuXG5cdCMgU2VsZWN0IHRoZSBmaXJzdCBpdGVtIGluIHRoZSB0YWIgYmFyXG5cdHRhYkJhci5zZXRTZWxlY3RlZCh0YWJCYXIuaXRlbXNbMF0ubmFtZSlcblxuXHRyZXR1cm4gdGFiQmFyXG4iLCJjbGFzcyBleHBvcnRzLlVJU291bmRcbiAgICBjb25zdHJ1Y3RvcjogKEBzcmMpIC0+XG4gICAgICAgIEBhdWRpbyA9IGRvY3VtZW50LmNyZWF0ZUVsZW1lbnQoXCJhdWRpb1wiKVxuICAgICAgICBAYXVkaW8uc2V0QXR0cmlidXRlKFwid2Via2l0LXBsYXlzaW5saW5lXCIsIFwidHJ1ZVwiKVxuICAgICAgICBAYXVkaW8uc2V0QXR0cmlidXRlKFwicHJlbG9hZFwiLCBcImF1dG9cIilcbiAgICAgICAgQGF1ZGlvLnNyYyA9IEBzcmNcbiAgICAgICAgXG4gICAgc3RvcDogLT5cbiAgICAgICAgQGF1ZGlvLnBhdXNlKClcbiAgICAgICAgQGF1ZGlvLmN1cnJlbnRUaW1lID0gMFxuICAgIHBsYXk6IC0+XG4gICAgICAgIEBzdG9wKClcbiAgICAgICAgQGF1ZGlvLnBsYXkoKSJdfQ==
