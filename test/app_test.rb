require_relative 'test_helper'
require './lib/app.rb'
require './lib/idea_box.rb'

class IdeaBoxAppTest < Minitest::Test 
	include Rack::Test::Methods

	def app
		IdeaBoxApp
	end
  
  def test_it_renders_an_index_page
  	response = get '/'

  	assert successful?
  	assert response.body.include?("A Bunch of Ideas")
  end
end