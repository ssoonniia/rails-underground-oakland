function Event(attributes){
  this.name = attributes.name;
  this.id = attributes.id;
  this.date = attributes.date;
  this.time = attributes.time;
  this.location = attributes.location;
  this.cost = attributes.cost;
  this.description = attributes.description;
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
   })
  })

// $('.create_event').on('click', function(y){
//   y.preventDefault()
//   // $('.add_new_event').html("<%=escape_javascript(render form )%>")
// })


})
