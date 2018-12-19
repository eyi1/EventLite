$(document).on('turbolinks:load', function(){
    $("#new_comment").on("submit", function(){
        //allows form to submit again
        // e.preventDefault() DOES NOT allow form to submit again
        let values = $(this).serialize();
        let posting = $.post(this.action, values);
        
        posting.done(function(res){
            $('#comment_content').val("")
            $(".comments").append(res)            
        })
        return false;
    })        
})

//load comments on event show page
// $(function(){
//     $("a.load_comments").on("click", function(e){
//         e.preventDefault();
//         $.get(this.href)
//         .done(function(res){
//             $("div.comments").text(res) 
//         })

        //low-level
        // $.ajax({
        //     method: "GET",
        //     url: this.href ,
        // }).done(function(res){
        //     $("div.comments").append(res)
                
        // }).error(function(error){
        //     alert(error)
        // })
//     })
// })