class TestsController < ApplicationController
  # skip_before_action :find_test, only: :show
  before_action :find_test, only: %i[show]
  after_action :send_log_message
  around_action :log_execute_time
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

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
    result = ["parameters: #{params.inspect}", "params[:controller]: #{params[:controller]}", "controller_name: #{controller_name}", "action_name: #{action_name}"]
    render plain: result.join("\n")
    #
    # pry
    # byebug
    #
    # test = ["class: #{params.class}", "params: #{params.inspect}"]
    # render plain: test_params
    #
    # test = Test.create(test_params)
    # render plain: test.inspect
    #
  end

  def new
  end

  def show
    # redirect_to root_path
    # redirect_to 'http://rubyonrails.org'
    # redirect_to root_url
    #
    # result = ["class: #{params.class}", "params: #{params.inspect}"]
    # render plain: result.join("\n")
    # title = Test.first.title
    render inline: '<%= @test.title %>'
  end

  def start
    result = ["class: #{params.class}", "parameters: #{params.inspect}"]
    render plain: "Start certain test \n\n\n#{result.join("\n")}"
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  def log_execute_time
    start = Time.now
    yield
    finish = (Time.now - start) * 1000
    logger.info("Executed time: #{finish}ms")
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found!'
  end
end
