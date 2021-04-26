class DrillsController < ApplicationController
  before_action :find_drill, only: [:show, :edit, :update, :destroy, :add_answer]
  def new
    @drill = Drill.new
    @drill.answers.build
  end
  def create 
    #render json: params
    @drill = Drill.new(drill_params)
    @drill.drillgroup = Drillgroup.find(
      params.require(:drill)[:drillgroup_id]
    )
    if @drill.save
      redirect_to drillgroup_path(@drill.drillgroup)
    else
      render :new
    end
  end
  def show
    @drillgroup = @drill.drillgroup
    @drill_list = @drillgroup.drills
    @score = params[:score].to_i || 0
    @answers_count = params[:answers_count].to_i || 0
    @next_drill = @drill_list[@answers_count].id
    @correct_answers = @drill.answers.map do |a|
      a.description
    end
    @submitted_answer = params[:answer]
    if @correct_answers.include?(@submitted_answer)
      @answer_correct = true
      @score = @score + 1
    else
      @answer_correct = false
    end
    @point = @drillgroup.points.find do |p|
      p.user = current_user
    end
  end
  def edit
  end
  def update
    if @drill.update drill_params
      redirect_to drillgroup_path(@drill.drillgroup)
    else
      render :edit
    end
  end
  def destroy
    @drill.destroy
    redirect_to drillgroup_path(@drill.drillgroup)
  end

  def add_answer
    @drill.answers.build
  end

  private
  def drill_params
    params.require(:drill).permit(
      :description,
      answers_attributes: [:description]
    )
  end
  def find_drill
    @drill = Drill.find(params[:id])
  end
end
