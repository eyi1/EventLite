namespace :db do
    desc 'Drop, Create, Migrate, Seed db, Start rails server'
    task dcms: :environment do
      puts 'dropping db....'
      Rake::Task['db:drop'].invoke
  
      puts 'creating db....'
      Rake::Task['db:create'].invoke
  
      puts 'running migrations ....'
      Rake::Task['db:migrate'].invoke
  
      puts 'seeding db ....'
      Rake::Task['db:seed'].invoke
  
      puts 'starting rails server ....'
      exec('rails s')    
    end
end

in lib -> tasks -> dcms.rake





 $(function(){
     $("a[href='/events']").on('click', function(){
          eventId = data.id
         fetch('http:localhost:3000/events/events_data')
         .then(parseJSON)
         .then(listEvents)
      })
  })

  function parseJSON(response){
     response.json()
  }
 $(function(){
     $(".events.index").ready(function(){
         const url = 'http:localhost:3000/events/events_data'
         $.get(url)
             .done(listEvents)
         })
 })
 
  function listEvents(eventsArray){
      console.log(eventsArray)
     eventsArray.forEach(function(event){
         localStorage.setItem("eventName", event.title)
         console.log(localStorage.event)
         $('#events-section').append(`<li>${localStorage.eventName}</li>`)
         document.getElementById("events-section").innerHTML = sessionStorage.eventName

     })
  }


<% if current_user %>
 <% link_to 'Browse Events', events_path  %></h2>  
 <% link_to 'Go To My Account', user_path(current_user) %>
<% else %>
 <% link_to "Sign Up", new_user_path %>
 <% link_to "Log In", login_path %>
 <%= link_to('Log In via Facebook', '/auth/facebook') %> 
<% end %>  
        
        
        
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


    in event create controller:
            #@tweet = current_user.tweets.build(content: params[:content])
            # @event = current_user.events.build(event_params)
            # @event.users << current_user
           # if @event.save

    in attendance controller:
        # event = Event.find_by_id(params[:event_id])
       # @attendance = event.attendances.create(user_id: params[:user_id], event_id: params[:event_id])

        # user = User.find_by_id(params[:user_id])
        # @attendance = event.attendances.create(:user_id => user.id)
        #redirect_to user_path(@attendance.user)



        <p><%= link_to 'View My Events', user_events_path(current_user)  %></p>
    
        <p><%= link_to 'Home', root_path %></p>
        
        <p><%= link_to 'Edit Profile', edit_user_path(@user) %></p>

        <p><%= link_to 'Sign Out', logout_path %></p>

        <p><strong>Member Since:</strong></p>
        <p><%= @user.member_since %></p>


          # <div class="form-group row">


  <!-- #  <%= f.label :username, class: 'col-sm-3 col-form-label' %>
  #   <div class="col-sm-9">
  #     <%= f.text_field :username, class: 'form-control' %>
  #   </div>
  # </div>
  # <div class="form-group row">
  #   <%= f.label :website, class: 'col-sm-3 col-form-label' %>
  #   <div class="col-sm-9">
  #     <%= f.text_field :website, class: 'form-control' %>
  #   </div>
  # </div>
  # <div class="form-group row">
  #   <%= f.label :bio, class: 'col-sm-3 col-form-label' %>
  #   <div class="col-sm-9">
  #     <%= f.text_area :bio, class: 'form-control' %>
  #   </div>
  # </div>
  # <div class="form-group row">
  #   <%= f.label :phone, class: 'col-sm-3 col-form-label' %>
  #   <div class="col-sm-9">
  #     <%= f.text_field :phone, class: 'form-control' %>
  #   </div>
  # </div>
  # <div class="form-group row">
  #   <%= f.label :gender, class: 'col-sm-3 col-form-label' %>
  #   <div class="col-sm-9">
  #     <%= f.text_field :gender, class: 'form-control' %>
  #   </div>
  # </div> -->

  <%= form_for(@user) do |f| %>

     <%= f.label :name %>: 
     <%= f.text_field :name %>
 
    </ br>
    <%= f.label :email %>:
    <%= f.email_field :email %>
    
    </ br>
    <%= f.label :password %>:
    <%= f.password_field :password %>
    
    </ br>
    <%= f.submit %>
  <% end %>


  <%= form_for @user, :url => url_for(:controller => 'sessions', :action => 'create') do |f| %>
    <%= f.label :email %>
    <%= f.email_field :email %>
    </ br>
    <%= f.label :password %>
    <%= f.password_field :password %>
    </ br>
    <%= f.submit "LOG IN" %>
  <% end %>