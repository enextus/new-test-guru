class TestsController < ApplicationController

  def index
    # pry
    result = ["class: #{params.class}", "params: #{params.inspect}"]
    render plain: "All tests \n\n\n#{result.join("\n")}"
    # byebug
    # render html: "<h1>All tests </h1>".html_safe
    # render json: { tests: Test.all }
    # render inline: '<p>My favourite language is: <%= %[ybuR].reverse! %>!</p>'
    # render file: 'public/hello', layout: false
    # head 204
    # head :no_content
    # render inline: '<%= console %>'

    # logger.info(self.object_id)
    #
    # respond_to do |format|
    #   format.html { render plain: 'All tests' }
    #   format.json { render json: { tests: Test.all } }
    # end
  end

  def create
    # pry
    result = ["1.Class: #{params.class}", "2.Parameters: #{params.inspect}"]
    render plain: result.join("\n")
    # byebug
  end

  def new
    # controller_name
    # action_name
  end

  def show
    # redirect_to root_path
    # redirect_to 'http://rubyonrails.org'
    result = ["Class: #{params.class}", "Params: #{params.inspect}"]
    render plain: result.join("\n")
  end

  def start
    result = ["class: #{params.class}", "parameters: #{params.inspect}"]
    render plain: "Start certain test \n\n\n#{result.join("\n")}"
  end
end
