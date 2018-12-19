$(document).on('turbolinks:load', function(){
// $(() => {
    bindClickHandlers()

    getEvent()
    
    getNextEvent()

    // sortEvents()
})

const bindClickHandlers = () => {
    $('.btn-btn-events').click(function(e){
        e.preventDefault()
        history.pushState({}, '', 'events')
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

// const sortEvents = () =>{
//     $(".sort_events").on('submit', function(e){
//         e.preventDefault();
//         var upcoming = $(this).val("Upcoming")
//         var past = $(this).val("Past")

//        $('#date').change(function(){
//            console.log($(this).val("Upcoming"))
//        })
//         if($(this).val("Upcoming")){
//             alert('upcoming')
//         }else if ($(this).val("Past")){
//            alert( "past" );
//         }else{
//             alert("nil")
//         }
//         var state = event.target.value
//     })
// }

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
        <p>${this.description} </p>
        <button class="next-event" data-id="${this.id}">Next</button>
        <a href="/events/${this.id}" class="view-event">View Details</a>
        `
    return eventDetails;
}

//alias to above arrow function:
// $(function(){
// })