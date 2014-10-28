require 'yaml/store'

class Idea
	include Comparable

	attr_reader :title, :description, :rank

  def initialize(attributes = {})
    @title = attributes["title"]
    @description = attributes["description"]
    @rank = attributes["rank"] || 0
  end

  def save
	  IdeaStore.create(to_h)
	end

	def to_h
	  {
	    "title" => title,
	    "description" => description,
	    "rank" => rank
	  }
	end

	def like!
		@rank = rank.next
	end

	def <=>
		rank <=> other.rank
	end
end