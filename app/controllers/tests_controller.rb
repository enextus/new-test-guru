class TestsController < ApplicationController

  def index
    # render plain: 'All tests'

    # render html: "<h1>All tests </h1>".html_safe

    # render json: { tests: Test.all }

    # render inline: '<p>My favourite language is: <%= %[ybuR].reverse! %>!</p>'

    # render file: 'public/hello', layout: false

    # head 204

    head :no_content
  end

end
