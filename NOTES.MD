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
