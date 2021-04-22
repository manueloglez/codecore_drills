class DrillsController < ApplicationController
  before_action :find_drill, only: [:show, :edit, :update, :destroy, :add_answer]
  def new
    @drill = Drill.new
    @drill.answers.build
  end
  def create 
    @drill = Drill.new(drill_params)
    if @drill.save
      redirect_to drill_path(@drill.id)
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @drill.update drill_params
      redirect_to drill_path(@drill)
    else
      render :edit
    end
  end
  def destroy
    @drill.destroy
    redirect_to drills_path
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
