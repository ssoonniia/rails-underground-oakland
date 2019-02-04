function Event(attributes){
  this.name = attributes.name;
  this.id = attributes.id;
  this.date = attributes.date;
  this.time = attributes.time;
  this.location = attributes.location;
  this.cost = attributes.cost;
  this.description = attributes.description;
  this.displayDate = attributes.display_date
  this.displayTime = attributes.display_time
  this.attendingUsers = attributes.attending_users
  this.user = new User(attributes.user)
  this.idOfNext = 0
}

// sort events function
function sortEvents(response){
  const orderedEvents = response.events.sort((a, b) => a.name.localeCompare(b.name))

  $(".events_display").html('')

  orderedEvents.map(e => {
    const event = new Event(e)
    const eventOrdTemp = event.renderOrdered()
    $('.events_display').append(eventOrdTemp)
  })
}

// ordered events
Event.prototype.renderOrdered = function(){
  return Event.orderedEventsTemplate(this)
}
// compile new event
Event.prototype.renderEvent = function(){
  return Event.templateNewEvent(this)
}

// compile next event
Event.prototype.renderNext = function(){
  return Event.template(this)
}

// success function - for new event
function newEvent(json){
  const event = new Event(json)
  const newEventTemp = event.renderEvent()
  $('div#add_event').html(newEventTemp)
}

// successFunction - for Next Event
function getEvent(json){
  const event = new Event(json)
  const userEvents = event.user.events

  // helper functions for get event
  const nextEventCheck = () => userEvents[userEvents.indexOf(findEvent[0]) + 1]
  const setIdOfNext = () => userEvents[userEvents.indexOf(findEvent[0]) + 1].id
  const findEvent = userEvents.filter(userEvent => userEvent.id === event.id)

  event.idOfNext = nextEventCheck() ? setIdOfNext() : 0

  var eventTemp = event.renderNext()
  $('div#show_event').html("")
  $('div#show_event').html(eventTemp)
}


$(function(){
// show rsvp
  Rsvp.source = $("#guests-template").html();
  Rsvp.template = Handlebars.compile(Rsvp.source)

  $("div.item").on('click','a.show_rsvps', function(e){
      e.preventDefault()


    $.ajax({
      url: this.href,
      method: "GET",
      success: function(response){
        showRsvps(response)
      },
        error: function(response){
          alert('Woops! Something went wrong')
        }
    })
    // disable link after request
     $(this).removeAttr('href')
  })
  // sorting events
  Event.sourceOrderedEvents = $("#ordered-events-template").html()
  Event.orderedEventsTemplate = Handlebars.compile(Event.sourceOrderedEvents)

  $("#sort_events").on('click', function(e){
    alert('was')

    const url = `/users/${this.dataset.id}`

     $.ajax({
       url: url,
       method: "GET",
       dataType: 'json',
       success: function(response){
         sortEvents(response)
       },
       error: function(response){
         alert('Woops! Something went wrong')
       }
     })
  })

  // New event request
  $("div.add_event").on('submit', 'form#new_event.new_event' function(y){
   y.preventDefault()
    alert('event')


    Event.sourceNewEvent = $("#new_event_template").html()
    Event.templateNewEvent = Handlebars.compile(Event.sourceNewEvent)

    $.ajax({
      url:this.action,
      method: "POST",
      data: $( this ).serialize(),
      processData: false,
      success: function(response){
        newEvent(response)
      },
      error: function(response){
        alert("Please complete the entire form before")
      }
    })
    $("form#new_event.new_event")[0].reset()
  })

// Show event request
  $('#show_event').on('click', 'a.next',function(e){
  
    e.preventDefault();

    Event.templateSource = $('#event-template').html()
    Event.template = Handlebars.compile(Event.templateSource);

    $.ajax({
      url: this.href,
      method: "GET",
      dataType: "json",
      success: function(response){
        getEvent(response)
      },
        error: function(response){
          alert("Woops - something went wrong")
        }
    })
  })
})
