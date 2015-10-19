        def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          redirect_to user      #  NEW LINE
        else 
          flash.now[:error] = 'Invalid email/password combination'
          render 'new'
        end

        def destroy
        log_out if logged_in?
        redirect_to root_url
      end 

      end