class UsersController < ApplicationController
  
  
  def show
    @user = User.find(params[:id])
  end
  def index
    @users = User.order(created_at: :asc)
  end
    def new
        @user = User.new
      end
    
      def create
        @user = User.new user_params
        if @user.save
          session[:user_id] = @user.id
          redirect_to @user
        else
          render :new
        end
      end

      def edit
        @user = User.find(params[:id])
        
      end

      def activate
        user = User.find(params[:id])
        if current_user.is_admin?
          user.activate_account!
          redirect_to users_path 
        else
          redirect_to :back
        end
      end

      def deactivate
        user = User.find(params[:id])
        if current_user.is_admin?
          user.deactivate_account!
          redirect_to users_path 
        else
          redirect_to :back
        end
      end
      

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:success] = "Profile updated"
          redirect_to @user
        else
          render 'edit'
        end
      end

      def leaderboard
        @users = User.all.sort {|a,b| b.total_points <=> a.total_points}
        @users.slice!(5, @users.count)
      end
    
      private

      
    
      def user_params
        params.require(:user).permit(
          :first_name,
          :last_name,
          :email,
          :password,
          :password_confirmation
        )
      end


end
