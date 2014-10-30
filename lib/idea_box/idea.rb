require 'yaml/store'

class Idea
	include Comparable

	attr_reader :title, :description, :rank, :id, :tags, :category

  def initialize(attributes = {})
    @title = attributes["title"]
    @description = attributes["description"]
    @rank = attributes["rank"] || 0
    @id = attributes["id"]
    @tags = attributes["tags"].split(",")
    @category = attributes["category"]
  end

  def save
	  IdeaStore.create(to_h)
	end

	def to_h
	  {
	    "title" => title,
	    "description" => description,
	    "rank" => rank,
	    "tags" => tags,
	    "category" => category
	  }
	end

	def like!
		@rank = rank.next
	end

	def <=>(other)
		other.rank <=> rank
	end
end