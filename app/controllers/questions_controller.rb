class QuestionsController < ApplicationController
  before_action :find_questions, only: %i[index]
  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
  end

  def show
    find_question
  end

  def create
    question = Question.create(question_params)
    redirect_to test_questions_path(question_params[:test_id])
  end

  def destroy
    Question.find(question_params[:id]).destroy
    redirect_to test_questions_path(question_params[:test_id])
  end

  private

  def find_questions
    @questions = Question.where(test_id: params[:test_id])
  end

  def find_question
    @question = Question.where(test_id: params[:test_id]).where(id: params[:id])
  end

  def question_params
    params.require(:question).permit(:id, :body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end
end
