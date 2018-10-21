class QuestionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create, :destroy], raise: false

  def index
    @question = Question.all

    render json: @question
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build(question_parameters)
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

  def question_parameters
    params.require(:question).permit(:text)
  end
end
