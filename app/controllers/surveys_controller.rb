class SurveysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:list], raise: false
  before_action :set_survey, only: [:show, :edit, :update, :destroy]


  def index
    @surveys = Survey.all
  end

  def list
    @surveys = Survey.all
    render json: {status: 'SUCCESS', message: 'Loaded all Surveys', data: @surveys}, status: :ok
  end


  def show
  end


  def new
    @survey = Survey.new
  end


  def edit
  end


  def create
    @survey = Survey.new(survey_parameters)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey created!!.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @survey.update(survey_parameters)
        format.html { redirect_to @survey, notice: 'Survey updated!!' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey destroyed!!' }
      format.json { head :no_content }
    end
  end


  private

  def set_survey
    @survey = Survey.find(params[:id])
  end


  def survey_parameters
    params.require(:survey).permit(:name, :questions_attributes =>  [:id, :data, :_destroy])
  end
end
