function Rsvp(attributes){
  this.guest = attributes.guests,
  this.user = new User(attributes.user)
  this.event = new Event(attributes.event)
}

Rsvp.prototype.renderLi = function(){
  return Rsvp.template(this)
}

function showRsvps(json){
  json.forEach(function(item){
    const rsvp = new Rsvp(item)
    const results = rsvp.renderLi()
    return $("div#add_guests_"+String(rsvp.event.id)).append(results)
  });
}

$(function(){
  Rsvp.source = $("#guests-template").html();
  Rsvp.template = Handlebars.compile(Rsvp.source)

  $("a.show_rsvps").on('click', function(e){
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
})
