$(".events.new").ready(function(){
    $('form').submit(function(e){
        e.preventDefault();
        
        var values = $(this).serialize();

        var posting = $.post(this.action, values)
        
        //  var current_user_id = $('input[data-id]').val();
        //  var posting2 = $.post(`/users/${current_user_id}/events`, values)
        posting.done(function(data){
            var event = data
            $("#eventTitle").append(event["title"])
            $('#eventLocation').append(`Location: ${event["location"]}`)
            $('#eventDateTime').append(event["starts"])
            $('#eventDateTime').append(event["ends"])
            $('#eventDescription').append(event["description"])
        }).fail(function(){
            alert("Oops, something went wrong")
        })
        
        // $.when(posting1).then(function(data){
        //     var event = data
        //     $('#eventDetails').text(event["title"])
        //     $('#eventDetails').text(event["location"])
        //     $('#eventDetails').text(event["starts"])
        //     $('#eventDetails').text(event["ends"])
        //     $('#eventDetails').text(event["description"])
        // }).fail(function(){
        //     alert("Oops, Something went wrong with one of the requests")
        // })

    })
})

