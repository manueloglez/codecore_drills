class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  
  def index
    @users = User.order(created_at: :desc)
  end

  def deactivate
    user = User.find(params[:user_id])
    if current_user.admin?
      user.deactivate_account!
      redirect_to users_path 
    else
      redirect_to :back
    end
  end
  
  private

  def authorize_admin!
    redirect_to root_path, alert: 'Access denied!' unless current_user.admin?
  end


end
