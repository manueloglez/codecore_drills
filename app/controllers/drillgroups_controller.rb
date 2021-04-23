class DrillgroupsController < ApplicationController
  def new
    @drillgroup = Drillgroup.new
  end

  def show 
    @drillgroup = Drillgroup.find params[:id]
    @drill = Drill.new
    @drill.answers.build
  end
  
  def index
    @drillgroups = Drillgroup.all
  end

  def destroy
    drillgroup = Drillgroup.find params[:id]
    drillgroup.destroy
    redirect_to drillgroups_path
  end

  def mydrills
    @drillgroups = Drillgroup.all
    @points = current_user.points
  end
end
