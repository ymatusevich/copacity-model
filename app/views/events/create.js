$('#new_event_modal').modal('hide');
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
