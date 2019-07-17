$(document).on('turbolinks:load', function(){
// $(() => {
   // bindClickHandlers()
    
    sortEvents()

    getEvent()
    
    getNextEvent()

    alphabetizeEvents()

})

const alphabetizeEvents = () => {
    $(".button").on('click', function(){
        fetch(`/events.json`)
            .then(res => res.json())
            .then(events => {
                events.sort(function(a, b) {
                    var nameA = a.title.toUpperCase(); 
                    var nameB = b.title.toUpperCase(); 
                    if (nameA < nameB) {
                      return -1;
                    }
                    if (nameA > nameB) {
                      return 1;
                    }                
                    return 0;
                  });
                  $('.event_list').html("")
                  events.forEach(function(event){
                    let newEvent = new Event(event)
                    let eventHTML = newEvent.formatIndex()
                    $('.event_list').append(eventHTML)
                })
        })
    })
}


const getEvent = () => {
    $(document).on('click', ".show_link", function(e){
        e.preventDefault()
        //this.href.json does not work   
        //$(this).attr('data-id') or
        //$(this).data("id") 
        let id = $(this).attr('data-id')
        history.pushState({}, '', `events/${id}`)
        fetch(`/events/${id}.json`)
            .then(res => res.json())
            .then(event => {
                $("#app-container").text('')
                let newEvent = new Event(event)
                let eventHTML = newEvent.formatShow()
                $('#app-container').append(eventHTML)
            })
    })
}

const getNextEvent = () => {
    $(document).on('click', ".next-event", function(){
        let nextId = parseInt($(this).attr("data-id"))+ 1;
        let id = $(this).attr('data-id')
        history.pushState({}, '', `${nextId}`)
        fetch(`/events/${id}/next`)
            .then(res => res.json())
            .then(next_event => {
                $("#app-container").text('')
                let newEvent = new Event(next_event)
                let eventHTML = newEvent.formatShow()
                $('#app-container').append(eventHTML)
            })
    })
}

const sortEvents = () => {
    $("form[class='sort_events']").click(function(e){
        //'input[type="submit"]' specify form by its class name
        e.preventDefault();
        $('.event_list').html("")
        if($('#date').val() === "Upcoming"){
            $.get(`/events/future.json`)
            .done(function(futureEvents){
                futureEvents.forEach(function(futureEvent){
                    let newEvent = new Event(futureEvent)
                    let eventHTML = newEvent.formatIndex()
                    $('.event_list').append(eventHTML)
                })
            })
        }else if($('#date').val() === "Past"){            
            $.get(`/events/old.json`)
            .done(function(oldEvents){
                oldEvents.forEach(function(oldEvent){
                    let newEvent = new Event(oldEvent)
                    let eventHTML = newEvent.formatIndex()
                    $('#app-container').append(eventHTML)
                })
            })
        }
    })

function Event(event){
    this.id = event.id
    this.title = event.title
    this.location = event.location
    this.starts = event.starts
    this.ends = event.ends
    this.description = event.description
    this.users = event.users
}

Event.prototype.formatIndex = function(){
    let eventTitle = `
        <h2><a href="/events/${this.id}" class="show_link" data-id="${this.id}">${this.title}</a></h2>        
    `
    return eventTitle;
}

Event.prototype.formatShow = function(){
    let formatter = this
    let date = JSON.stringify(formatter.starts)
    date.split(" ")
    date = date[6] + date[7] + date[8] + date[9] + date[10]

    formatter.usersList = "";
    formatter.users.forEach(function(user){
        formatter.usersList += `${user.name}<br />` 
    })
    let eventDetails = `
        <h2>${this.title}</h2>
        <p><h4>When: ${date}</h4></p>
        <p><h4>Location: ${this.location}<br /></h4>
        <p><h4>Description:</h4></p> 
        <h4>${this.description}</h4>
        <p><h4>Going:</strong></h4></p>
        <p>${formatter.usersList} </p><br />
        <button class="next-event" data-id="${this.id}">Next</button> |
        <a href="/events/${this.id}" class="view-event">View Details</a> |
        `
    return eventDetails;
    }
}


//alias to above arrow function:
// $(function(){
// })

//$icon-font-path: '../fonts/bootstrap/';
// @import "bootstrap-sprockets";

//refactor 
// const bindClickHandlers = () => {
//     $('.btn-btn-my-events').click(function(e){
//         e.preventDefault()
//         history.pushState({}, '', 'events')
//         fetch('/events.json')
//             .then((res) => res.json())
//             .then(events => {
//                 $("#app-container").text('')
//                 events.forEach(event => {
//                     let newEvent = new Event(event)
//                     let eventHTML = newEvent.formatIndex()
//                     $('#app-container').append(eventHTML)
//                 })
//             })
//     })
// }