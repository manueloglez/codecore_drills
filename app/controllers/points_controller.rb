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
  def update
    @point = Point.find params[:id]
    @answers_count = params[:answer_correct].to_i
    @answers_count = 1 if @answers_count == 0
    @correct_answers = params[:correct_answers].to_i
    @score = (@correct_answers * 100.0 / @answers_count).round(1)
    @point.update( taken: @point.taken + 1, score: @score )
  end

end
