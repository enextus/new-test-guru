class QuestionsController < ApplicationController
  before_action :find_questions, only: %i[index]

  def index
  end

  def show
    find_question
  end

  private

  def find_questions
    @questions = Question.where(test_id: params[:test_id])
  end

  def find_question
    @question = Question.where(test_id: params[:test_id]).where(id: params[:id])
  end
end
