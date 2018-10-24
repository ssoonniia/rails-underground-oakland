function Rsvp(attributes){
    this.guest = attributes.guests,
    this.user = attributes.user.username,
    this.event = attributes.event.name
    this.event_id = attributes.event.id
    // this.event = new Event.(attributes.event)
}

function success(json){
   json.forEach(function(item){
    var rsvp = new Rsvp(item)
   var results = rsvp.renderLi(rsvp)
 return $("div#add_guests_"+String(rsvp.event_id)).append(results)
});


//   tested and returned
// (2) [Rsvp, Rsvp]
// 0: Rsvp {guest: 1, user: "jack", event: "First Fridays"}
// 1: Rsvp {guest: 1, user: "Sonia Duarte Nicas", event: "First Fridays"}
// length: 2
  // var rsvpsLi = rsvps.renderLi();
;
}

Rsvp.error = function(response){
  console.log('Sorry! Something went wrong', response)
}


// prefill and return template

Rsvp.prototype.renderLi = function(){
  return Rsvp.template(this)
}


$(document).ready(function(){
  Rsvp.source = $("#guests-template").html();
  Rsvp.template = Handlebars.compile(Rsvp.source)

  $("a.show_rsvps").on('click', function(e){
    e.preventDefault()
    $.ajax({
      url: this.href,
      method: "GET",
      success: function(response){
        success(response)
      }
    })
  })
})
