class CommentsController < ApplicationController
    before_action :set_event

    def show 
        #render :layout => "events/show"
    end

    def index 
        @comments = @event.comments
        #automaticall route to /events/:id/comments
        #will render comments/index
    end

    # def new 
    #     @comment = Comment.new
    # end

    # def create 
    #      @comment = Comment.new(comment_params)
        
    #     if params[:event_id]
    #         @event = Event.find(params[:event_id])
    #         @event.comments.build(comment_params)
    #         @comment.save 
    #     else
    #         redirect_to events_path
    #     end 
    # end

    # def edit      
    # end

    # def update 
    #     if @comment.update(comment_params)
    #         render 'events/show' 
    #     else
    #         render 'events/show'
    #     end      
    # end

    # def destroy
    #     @comment.destroy
    #     render 'events/show'
    # end

    private
    def set_event 
        @event = Event.find(params[:event_id])   
    end
    
    # def comment_params
    #     params.require(:comment).permit(
    #         :content
    #     )
    # end

    # def set_comment
    #     @comment = Comment.find(params[:id])
    # end
end
