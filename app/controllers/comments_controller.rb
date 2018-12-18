class CommentsController < ApplicationController
    before_action :set_event

    def show 
        #render :layout => "events/show"       
    end

    def index 
        @comments = @event.comments
        
        respond_to do |f|
            f.html
            f.json {render json: @comments}
        end
        #automaticall route to /events/:id/comments
        #will implicitly render comments/index
        render 'comments/index', :layout => false
    end

    def create
         @comment = @event.comments.build(comment_params)
         #@comment = Comment.new(comment_params) (alternative option)
         if @comment.save
            #@event.comments << @comment (alternative option)
            redirect_to @event
         else
            render "events/show"
         end
    end

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
    
    def comment_params
        params.require(:comment).permit(
            :content,
            :user_id,
            :event_id
        )
    end
end