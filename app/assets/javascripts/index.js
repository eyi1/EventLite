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
        fetch(`/events.json`)
            .then((res) => res.json())
            .then(events => {
                events.forEach(event => {
                    let newEvent = new Event(event)
                    let eventHTML = newEvent.formatIndex()
                    $('#app-container').append(eventHTML)
                })
            })
    })
}

//alias to above arrow function:
// $(function(){

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
    let eventHTML = `
        <h2>${this.title}</h2>        
    `
    return eventHTML;
}