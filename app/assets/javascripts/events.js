function Event(attributes){
  this.name = attributes.name;
  this.id = attributes.id;
  this.date = attributes.date;
  this.time = attributes.time;
  this.location = attributes.location;
  this.cost = attributes.cost;
  this.description = attributes.cost;
  this.user_id = attributes.user_id
  this.rsvps = attributes.rsvps
  this.attendingUser = attributes.attending_user
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
       successEvent(response)
     }
     // close success
   })
   // close ajax
  })
   // close click event
   $("#new_event.new_event").on('click', function(y){
     y.preventDefault()

     $.ajax({
       
     })

   })
})
