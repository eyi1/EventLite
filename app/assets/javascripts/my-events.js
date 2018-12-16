// $(function(){
//     $('.btn-btn-my-events').click(function(e){
//         e.preventDefault();
//         let url = this.href
//         let id = $(this).attr('data-id')
//         fetch(`/users/${id}/events.json`)
//         .then(res => res.json())
//         .then(events => {
//            events.forEach(function(event){
//             let newEvent = new Event(event)
//             let eventHTML = newEvent.formatIndex()
//             $('.list').append(eventHTML)             
//            })
//        })          
//     })       
// })

// function Event(event){
//     this.id = event.id
//     this.title = event.title
//     this.location = event.location
//     this.starts = event.starts
//     this.ends = event.ends
//     this.description = event.description
// }

// Event.prototype.formatIndex = function(){
//     let eventTitle = `
//         <h2><a href="/events/${this.id}" id="show_link" data-id="${this.id}">${this.title}</a></h2>        
//     `
//     return eventTitle;
// }