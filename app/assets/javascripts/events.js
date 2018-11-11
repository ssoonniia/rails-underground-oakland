function Event(attributes){
  this.name = attributes.name;
  this.id = attributes.id;
  this.date = attributes.date;
  this.time = attributes.time;
  this.location = attributes.location;
  this.cost = attributes.cost;
  this.description = attributes.cost;
  this.user = new User(attributes.user)
  this.rsvps = attributes.rsvps
  this.attendingUser = attributes.attending_user
  this.displayDate = attributes.display_date
  this.displayTime = attributes.display_time
  this.attendingUsers = attributes.attending_users
}

function successEvent(json){
  var event = new Event(json)

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
 $('a.next').on('click', function(e){
   e.preventDefault();

   Event.templateSource = $('#event-template').html()
   Event.template = Handlebars.compile(Event.templateSource);

   $.ajax({
     url: this.href,
     method: "GET",
     dataType: "json",
     success: function(response){
       debugger
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
       success: function(response){
         debugger
       successNewEvent(response)

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
