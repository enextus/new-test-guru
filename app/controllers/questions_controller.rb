class QuestionsController < ApplicationController
  before_action :find_questions, only: %i[index]

  def index
    render file: 'app/views/questions/index.html.erb'
  end

  private

  def find_questions
    @questions = Question.where(test_id: params[:test_id])
  end
end
