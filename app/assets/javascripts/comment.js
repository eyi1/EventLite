$(function(){
    $("a.load_comments").on("click", function(e){
        e.preventDefault();
        $.get(this.href)
        .success(function(res){
            $("div.comments").html(res) 
        })

        //low-level
        // $.ajax({
        //     method: "GET",
        //     url: this.href ,
        // }).done(function(res){
        //     $("div.comments").append(res)
                
        // }).error(function(error){
        //     alert(error)
        // })
    })
})