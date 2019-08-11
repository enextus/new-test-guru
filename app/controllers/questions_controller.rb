class QuestionsController < ApplicationController
  before_action :find_questions, only: %i[index]


  def index
  end

  def show
    @question = Question.where(test_id: params[:test_id], id: params[:id])
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

  def question_params
    params.require(:question).permit(:id, :body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end
end
