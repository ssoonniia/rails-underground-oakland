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

function successEvent(json){
  const event = new Event(json)
  let userEvents = event.user.events
  const findEvent = userEvents.filter(userEvent => userEvent.id === event.id)

  if (userEvents[userEvents.indexOf(findEvent[0]) + 1]){
    event.idOfNext = userEvents[userEvents.indexOf(findEvent[0]) + 1].id
  }

  var eventTemp = event.renderLi()
  $('div#show_event').html("")
  $('div#show_event').html(eventTemp)
}


Event.prototype.renderLi = function(){
  return Event.template(this)
}

Event.prototype.renderEvent=function(){
  return Event.templateNewEvent(this)
}


$(document).ready(function(){
 $('#show_event').on('click', 'a.next',function(e){
   e.preventDefault();

   Event.templateSource = $('#event-template').html()
   Event.template = Handlebars.compile(Event.templateSource);

   $.ajax({
     url: this.href,
     method: "GET",
     dataType: "json",
     success: function(response){
       successEvent(response)


     }
     // close success
   })
   // close ajax
  })
   // close click event
   $("#new_event.new_event").on('submit', function(y){
     y.preventDefault()


     Event.sourceNewEvent = $("#new_event_template").html()
     Event.templateNewEvent = Handlebars.compile(Event.sourceNewEvent)

     $.ajax({
       url:this.action,
       method: "POST",
       data: $( this ).serialize(),
       processData: false,
       success: function(response){
         debugger
       successNewEvent(response)

     }, error: function(response){
       debugger
       alert("Please complete the entire form before")
     }
     })
      $("form#new_event.new_event")[0].reset()
   })

   function successNewEvent(json){
     var event = new Event(json)
     var newEventTemp = event.renderEvent()
     $('div#add_event').html(newEventTemp)
   }
})
