require_relative 'test_helper'
require_relative '../lib/idea_box/idea'

class IdeaTest < Minitest::Test 

	def setup
		@attributes = {
			"title" => "Horses in space",
			"description" => "the future of space travel",
			"rank" => 5,
			"id" => 3,
			"tags" => "farm animals, space",
			"category" => "personal"
		}
	end

	def test_an_idea_has_attributes
		idea = Idea.new(@attributes)

		assert_equal "Horses in space", idea.title
		assert_equal "the future of space travel", idea.description
		assert_equal 5, idea.rank
		assert_equal 3, idea.id
		assert_equal "farm animals", idea.tags.first
		assert_equal "personal", idea.category
	end

	def test_it_can_be_liked
		idea = Idea.new(@attributes)

		assert_equal 5, idea.rank
		idea.like!
		assert_equal 6, idea.rank
	end
end