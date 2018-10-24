function Rsvp(attributes){
    this.guest = attributes.guests,
    this.user = attributes.user.username,
    this.event = attributes.event.name
}

Rsvp.success = function(json){
  var rsvps = data.map(function(item){
    new Rsvp(item)
  });

  var rsvpLi = rsvp.renderLi()
  $('.guests').append(rsvpLi)
}
