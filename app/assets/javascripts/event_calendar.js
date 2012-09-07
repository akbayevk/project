/*
 * Smart event highlighting
 * Handles for when events span rows, or don't have a background color
 */
Event.observe(window, "load", function() {
  var highlight_color = "#2EAC6A";
  
  // highlight events that have a background color
  $$(".ec-event-bg").each(function(ele) {
    ele.observe("mouseover", function(evt) {
      event_id = ele.readAttribute("data-event-id");
      event_class_name = ele.readAttribute("data-event-class");
      $$(".ec-"+event_class_name+"-"+event_id).each(function(el) {
        el.setStyle({ backgroundColor: highlight_color });
      });
    });
    ele.observe("mouseout", function(evt) {
      event_id = ele.readAttribute("data-event-id");
      event_class_name = ele.readAttribute("data-event-class");
      event_color = ele.readAttribute("data-color");
      $$(".ec-"+event_class_name+"-"+event_id).each(function(el) {
        el.setStyle({ backgroundColor: event_color });
      });
    });
  });
  
  // highlight events that don't have a background color
  $$(".ec-event-no-bg").each(function(ele) {
    ele.observe("mouseover", function(evt) {
      ele.setStyle({ color: "white" });
      ele.select("a").each(function(link) {
        link.setStyle({ color: "white" });
      });
      ele.select(".ec-bullet").each(function(bullet) {
        bullet.setStyle({ backgroundColor: "white" });
      });
      ele.setStyle({ backgroundColor: highlight_color });
    });
    ele.observe("mouseout", function(evt) {
      event_color = ele.readAttribute("data-color");
      ele.setStyle({ color: event_color });
      ele.select("a").each(function(link) {
        link.setStyle({ color: event_color });
      });
      ele.select(".ec-bullet").each(function(bullet) {
        bullet.setStyle({ backgroundColor: event_color });
      });
      ele.setStyle({ backgroundColor: "transparent" });
    });
  });
});



//Copyright (c) 2009 Elevation
//
//Permission is hereby granted, free of charge, to any person obtaining
//a copy of this software and associated documentation files (the
//"Software"), to deal in the Software without restriction, including
//without limitation the rights to use, copy, modify, merge, publish,
//distribute, sublicense, and/or sell copies of the Software, and to
//permit persons to whom the Software is furnished to do so, subject to
//the following conditions:
//
//The above copyright notice and this permission notice shall be
//included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.