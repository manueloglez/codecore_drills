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
    @points = current_user.points
  end
end
