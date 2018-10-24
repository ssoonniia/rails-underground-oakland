function Rsvp(attributes){
    this.guest = attributes.guests,
    this.user = attributes.user.username,
    this.event = attributes.event.name
}

Rsvp.success = function(json){
  json.forEach(function(item){
    var rsvp = new Rsvp(item)
  });

  var rsvpLi = rsvp.renderLi()
  $('.guests').append(rsvpLi)
}
