class QuestionsController < ApplicationController
  def index
    result = ["parameters: #{params.inspect}"]
    render plain: result.join("\n")
    # render json: {success: true}, status: 200
  end

  def show
    result = ["parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end
end
