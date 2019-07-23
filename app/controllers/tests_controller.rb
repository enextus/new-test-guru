class TestsController < ApplicationController

  def index
    # pry
    result = ["1.Class: #{params.class}", "2.Parameters: #{params.inspect}"]
    render plain: result.join("\n")
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

  def show
    redirect_to root_path
    # redirect_to 'http://rubyonrails.org'
  end

  def new
    # controller_name
    # action_name
  end
end
