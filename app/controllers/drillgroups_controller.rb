class DrillgroupsController < ApplicationController
  def new
    @drillgroup = Drillgroup.new
  end

  def create
    @drillgroup = Drillgroup.new drillgroup_params

    if @drillgroup.save
      flash[:primary] = "#{@drillgroup.title} created"
      redirect_to drillgroup_path(@drillgroup.id)
    else
      render :new
    end
    # p params
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

  def drillgroup_params
    params.require(:drillgroup).permit(:title, :description, :level, :value)
  end
end
