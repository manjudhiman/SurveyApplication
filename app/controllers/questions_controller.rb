class QuestionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create, :destroy], raise: false

  def show
    @question = Question.find(params[:id])
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build(question_params)
    if @question.save
      render json: @survey, status: :created
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    head :no_content
  end

  private

  def question_params
    params.require(:question).permit(:data)
  end
end
