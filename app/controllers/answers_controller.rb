class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params.require(:answer).permit(:description))
  end
  def destroy
    @answer = Answer.find(params[:id])
  end
end
