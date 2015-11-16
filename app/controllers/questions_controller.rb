class QuestionsController < ApplicationController
  before_action :set_question, only: %i(show edit update destroy)

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: t('question_was_successfully_created')
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: t('question_was_successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: t('question_was_successfully_destroyed')
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(
      :title,
      :description,
      :user_id,
      :resolve
    )
  end
end
