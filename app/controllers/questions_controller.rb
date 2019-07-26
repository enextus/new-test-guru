class QuestionsController < ApplicationController
  before_action :find_questions, only: %i[index]

  def index
    render plain: @questions.join("\n")
  end

  private

  def find_questions
    @questions = Question.where(test_id: params[:test_id])
  end
end
