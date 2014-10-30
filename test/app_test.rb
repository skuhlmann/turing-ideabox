$:.unshift File.expand_path("./../../lib", __FILE__)
require 'bundler'
Bundler.require
require 'app'
require 'minitest/autorun'
require 'minitest/pride'


class IdeaBoxAppTest < Minitest::Test 
	include Rack::Test::Methods

	def test_false
		assert false
	end

	# include Rack::Test::Methods

	# def app
	# 	IdeaBoxApp
	# end
  
 #  def test_it_renders_an_index_page
 #  	response = get '/'

 #  	assert successful?
 #  	assert response.body.include?("A Bunch of Ideas")
 #  end
end