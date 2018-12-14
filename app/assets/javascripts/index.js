// $(function(){
//     $("a[href='/events']").on('click', function(){
//         // eventId = data.id
//         fetch('http://localhost:3000/events/events_data')
//         .then(parseJSON)
//         .then(listEvents)
//      })
//  })

//  function parseJSON(response){
//     response.json()
//  }
// //$(function(){
//     $(".events.index").ready(function(){
//         const url = 'http://localhost:3000/events/events_data'
//         $.get(url)
//             .done(listEvents)
//         })
// //})
 
//  function listEvents(eventsArray){
//      //console.log(eventsArray)
//     eventsArray.forEach(function(event){
//         localStorage.setItem("eventName", event.title)
//         //console.log(localStorage.event)
//         $('#events-section').append(`<li>${localStorage.eventName}</li>`)
//         //document.getElementById("events-section").innerHTML = sessionStorage.eventName

//     })
//  }

$(() => {
    bindClickHandlers()
})

const bindClickHandlers = () => {
    $('.btn-btn-events').click((e) => {
        e.preventDefault()
        history.pushState(null, null, "events")
        fetch('/events.json')
            .then((res) => res.json())
            .then(events => {
                $("#app-container").text('')
                events.forEach(event => {
                    let newEvent = new Event(event)
                    let eventHTML = newEvent.formatIndex()
                    $('#app-container').append(eventHTML)
                })
            })
    })
}

$(document).on('click', ".show_link", function(e){
    e.preventDefault()
    //this.href.json does not work   
    //$(this).attr('data-id') 
    id = $(this).data("id")
    history.pushState(null, null, `events/${id}`)
    fetch(`/events/${id}.json`)
        .then(res => res.json())
        .then(event => {
            $("#app-container").text('')
            let newEvent = new Event(event)
            let eventHTML = newEvent.formatShow()
            $('#app-container').append(eventHTML)
        })
})

// $(document).on('click', 'next-post', function(){
//     let id = $(this).
// })

function Event(event){
    this.id = event.id
    this.title = event.title
    this.location = event.location
    this.starts = event.starts
    this.ends = event.ends
    this.description = event.description
}

Event.prototype.formatIndex = function(){
    let eventTitle = `
        <h2><a href="/events/${this.id}" class="show_link" data-id="${this.id}">${this.title}</a></h2>        
    `
    return eventTitle;
}

Event.prototype.formatShow = function(){
    let eventDetails = `
        <h3>${this.title}</h3>
        <p>${this.location} </p>
        <p>${this.starts} </p>
        <p>${this.ends} </p>
        <p>${this.description} </p>
    `
    return eventDetails;
}


//alias to above arrow function:
// $(function(){
// })