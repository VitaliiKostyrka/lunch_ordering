document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'dayGrid', 'interaction' ],
        defaultView: 'dayGridMonth',
        validRange: {
            end: new Date() // hidden future days
        },
        selectable: true,
        dateClick: function(info) {
          window.location.href = "/?date="+ info.dateStr
          }
    });

    calendar.render();
});

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar-admin');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    plugins: [ 'dayGrid', 'interaction' ],
    defaultView: 'dayGridMonth',
    validRange: {
      end: new Date() // hidden future days
    },
    selectable: true,
    dateClick: function(info) {
      window.location.href = "/lunch_admin/?date="+ info.dateStr
    }
  });

  calendar.render();
});
