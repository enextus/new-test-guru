class QuestionsController < ApplicationController
  def index
    render json: {success: true}, status: 200
  end
end
