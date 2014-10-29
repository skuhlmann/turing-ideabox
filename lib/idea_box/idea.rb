require 'yaml/store'

class Idea
	include Comparable

	attr_reader :title, :description, :rank, :id, :tags

  def initialize(attributes = {})
    @title = attributes["title"]
    @description = attributes["description"]
    @rank = attributes["rank"] || 0
    @id = attributes["id"]
    @tags = attributes["tags"].split(",")
  end

  def save
	  IdeaStore.create(to_h)
	end

	def to_h
	  {
	    "title" => title,
	    "description" => description,
	    "rank" => rank,
	    "tags" => tags
	  }
	end

	def like!
		@rank = rank.next
	end

	def <=>(other)
		other.rank <=> rank
	end

end