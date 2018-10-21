class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_parameters)
    @answer.user = current_user
    @answer.save

    redirect_to @question
  end

  private

  def answer_parameters
    params.require(:answer).permit(:text, :user_id, :question_id)
  end
end