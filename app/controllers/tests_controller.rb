class TestsController < ApplicationController
  def index
    # pry
    result = ["class: #{params.class}", "params: #{params.inspect}"]
    render plain: "All tests \n\n\n#{result.join("\n")}"
    # render plain: "All tests "
    # render html: "<h1>All tests</h1>".html_safe
    # byebug
    # render html: "<h1>All tests </h1>".html_safe
    # render json: { tests: Test.all }
    # render inline: '<p>My favourite language is: <%= %[ybuR].reverse! %>!</p>'
    # render file: 'public/hello', layout: false
    # head 204
    # head :no_content
    # render inline: '<%= console %>'

    # logger.info(self.inspect)
    #
    # respond_to do |format|
    #   format.html { render plain: 'All tests' }
    #   format.json { render json: { tests: Test.all } }
    # end
  end

  def create
    # pry
    # byebug
    # test = ["class: #{params.class}", "params: #{params.inspect}"]

    # render plain: test_params
    # {"title"=>"Rails Test from Form 23", "level"=>"3"}
    test_params[:level] = test_params[:level].gsub(/\D/, '').to_i
    test = Test.create(test_params)
    render plain: test.inspect
  end

  def new
    # result = ["params[:controller]: #{params[:controller]}", "parameters: #{params.inspect}", "controller_name: #{controller_name}", "action_name: #{action_name}"]
    # render plain: result.join("\n")
  end

  def show
    # redirect_to root_path
    # redirect_to 'http://rubyonrails.org'
    redirect_to root_path
    # redirect_to root_url
    # result = ["class: #{params.class}", "params: #{params.inspect}"]
    # render plain: result.join("\n")
  end

  def start
    result = ["class: #{params.class}", "parameters: #{params.inspect}"]
    render plain: "Start certain test \n\n\n#{result.join("\n")}"
  end

  private

  def test_params
    # {"title"=>"Rails Test from Form 23", "level"=>"3"}
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

end
