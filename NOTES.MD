        # if auth
        #     @user = User.find_or_create_by(uid: auth['uid']) do |u|
               
        #         u.name = auth['info']['name']
        #         u.email = auth['info']['email']
        #         u.image = auth['info']['image']
        #       end
              
        #       if @user.save
        #         session[:user_id] = @user.id
        #         redirect_to user_path(@user)
        #       else
        #         redirect_to login_path
        #       end

            # def create
    #     if auth_hash = request.env["omniauth.auth"]
    #         raise auth_hash.inspect
    #         #auth_hash = request.env["omniauth.auth"]
            
    #         # oauth_id = request.env["omniauth.auth"][:id]
    #         @user = User.find_or_create_by_omniauth(auth_hash)
    #         #   if @user.save
    #               session[:user_id] = @user.id
    #         #     redirect_to user_path(@user)
    #         #   else
    #         #     redirect_to login_path
    #         #   end
    #     else
    #         @user = User.find_by(email: params[:user][:email])
    #         if @user && @user.authenticate(params[:user][:password])
    #             session[:user_id] = @user.id
    #                 #flash[:success] = "Successfully logged in!"
    #             redirect_to user_path(@user)
    #         else
    #                 #flash[:error] = "Couldn't find username and password"
    #             redirect_to login_path
    #         end
    #     end

    # end


<%= tag(:input, :type => "hidden", :name => request_forgery_protection_token.to_s, :value => form_authenticity_token) %>
<%= tag(:input, :type => "hidden", :name => :user_id, :value => current_user.id) %>
<%= tag(:input, :type => "hidden", :name => :event_id, :value => @event.id) %>


         <input type="hidden" name="authenticity_token", value="<%= form_authenticity_token %>">
         <input type="hidden" name="user_id", value=current_user.id>
         <input type="hidden" name="event_id", value=@event.id>
         <input type="submit" value="RSVP">



    <p>
    <% @event.users.each do |user| %>
        <%  if user.id == current_user.id %>
            <%= button_to 'Edit Event', [:edit, @event] %>
         <% else %>
            <form action="/attendances/new" method="post">
                <%= tag(:input, :type => "hidden", :name => request_forgery_protection_token.to_s, :value => form_authenticity_token) %>
                <%= tag(:input, :type => "hidden", :name => :user_id, :value => current_user.id) %>
                <%= tag(:input, :type => "hidden", :name => :event_id, :value => @event.id) %>     
                <input type="submit" value="RSVP">   
            </form>
        <% end %>
    <% end %>
    </p>
    
    <p>
    <%= link_to 'Back', events_path, class: "btn btn-primary btn-light" %>
    </p>

        <% if logged_in? %>
    <% if can? :update, @event %>


    <%= form_for([@event, @event.users.build] do |f| %>
    <%= f.hidden_field :user_id, value: current_user.id %>
    <%= f.submit "RSVP", class: "btn btn-default" %>
<% end %>




        # if params[:user_id]
        #     @events = User.find(params[:user_id]).events 
        # else
        #     @events = Event.all
        # end

        # if !params[:date].blank?
        #     if params[:date] == "Upcoming"
        #       @events = Event.from_today
        #     else
        #       @events = Event.old_events
        #     end
        # else
        #     # if no filters are applied, show all events
        #     if params[:user_id]
        #         @events = User.find(params[:user_id]).events 
        #     else
        #         @events = Event.all
        #     end
        # end


view/events/_form
<%= f.date_select :starts, {order: [:month, :day, :year]} %>
    <%= f.time_select :starts, { start_hour: 7, end_hour: 23, ampm: true, :minute_step => 15, :time_separator => "" } %>
    <br>
    <br>
    <%= f.label :ends %>
    <br>
    <%= f.date_select :ends, {order: [:month, :day, :year]} %>
    <%= f.time_select :ends, { start_hour: 7, end_hour: 23, ampm: true, :minute_step => 15, :time_separator => "" } %>