class DrillgroupsController < ApplicationController
  def new
    @drillgroup = Drillgroup.new
  end
  
  def index
    @drillgroups = Drillgroup.all
    @points = current_user.points
  end

end
