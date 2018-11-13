// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require cocoon
//= require popper
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require moment
//= require fullcalendar

$(document).ready(function() {
  $('#calendar').fullCalendar({
    events: '/events.json',
    customButtons: {
      newEvent: {
        text: 'Add new event',
        click: function() {
          $.ajax({
            url: '/events/new'
          })
        }
      }
    },
    header: {
      left: 'prev,next today newEvent',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    }
  });
});
