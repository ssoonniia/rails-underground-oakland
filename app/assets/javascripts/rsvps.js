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

// $(function(){
  // alert('working')
  // Rsvp.source = $("#guests-template").html();
  // Rsvp.template = Handlebars.compile(Rsvp.source)
  //
  // $("div.event-container div.item").on('click','a.show_rsvps', function(e){
  //   alert("clicked")
  //     e.preventDefault()
  //
  //
  //   $.ajax({
  //     url: this.href,
  //     method: "GET",
  //     success: function(response){
  //       showRsvps(response)
  //     },
  //       error: function(response){
  //         alert('Woops! Something went wrong')
  //       }
  //   })
  //   // disable link after request
  //    $(this).removeAttr('href')
  // })
// })
