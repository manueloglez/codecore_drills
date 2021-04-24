class SessionsController < ApplicationController
    def new
    end
  
    def create
        @user = User.find_by_email params[:email]
        if @user && @user.is_active && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          flash[:primary] = "Welcome, #{@user.full_name}"
          redirect_to @user
        elsif !@user.is_active 
          flash[:alert] = "Your account is not activated"
          redirect_to root_path
        elsif @user.is_active && !(@user && @user.authenticate(params[:password]))
          flash[:alert] = "Wrong email or password"
          render :new
      end
    end

    def destroy
        session[:user_id] = nil
        flash[:primary] = "Signed Out"
        redirect_to root_path
    end



end
