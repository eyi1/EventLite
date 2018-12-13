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
