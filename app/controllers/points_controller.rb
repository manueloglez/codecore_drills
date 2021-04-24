class PointsController < ApplicationController
  def create
    drillgroup = Drillgroup.find params[:drillgroup_id]
    point = Point.new(user: current_user, drillgroup: drillgroup)
    if point.save
      flash[:success] = "Drillgroup added"
    else
      flash[:danger] = "Drillgroup already added"
    end
    redirect_to mydrills_path
  end
  def destroy
    point = Point.find params[:id]
    point.destroy
    flash[:secondary] = "Drillgroup removed"
    redirect_to mydrills_path
  end
end
