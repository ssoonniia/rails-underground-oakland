$(document).ready(function(){
  console.log("from rsvps.js")
})


function Rsvp(attributes){
    this.guest = attributes.guests,
    this.user = attributes.user.username,
    this.event = attributes.event.name
}

Rsvp.success = function(json){
  var rsvps = data.map(function(item){
    return new Rsvp(item)
  });
//   tested and returned
// (2) [Rsvp, Rsvp]
// 0: Rsvp {guest: 1, user: "jack", event: "First Fridays"}
// 1: Rsvp {guest: 1, user: "Sonia Duarte Nicas", event: "First Fridays"}
// length: 2
  var rsvpsLi = rsvps.renderLi();
  $('.guests').append(rsvpsLi);
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
    debugger;
    $.ajax({
      url: this.href,
      method: "GET",
      success: function(data){
       // create js object rsvp
       debugger;
      }
    })
    e.preventDefault()
  })
})
