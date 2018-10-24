function Event(attributes){
  this.name = attributes.name;
  this.id = attributes.id;
  this.date = attributes.date;
  this.time = attributes.time;
  this.location = attributes.location;
  this.cost = attributes.cost;
  this.description = attributes.cost;
  this.user_id = attributes.user_id
}

$(document).ready(function(){
  $(".show_rsvps").on("click", function(e){

      alert('I was clicked from events')
    e.preventDefault()

  })
})
