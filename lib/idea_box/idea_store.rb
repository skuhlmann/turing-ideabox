require 'yaml/store'

class IdeaStore

	def self.database
    return @database if @database

		@database = YAML::Store.new('db/ideabox')
    @database.transaction do 
      @database['ideas'] ||= []
    end
    @database
	end

	def self.raw_ideas
		database.transaction do |db|
			db['ideas'] || []
		end
	end

	def self.all
    ideas = []
    raw_ideas.each_with_index do |data, i|
      ideas << Idea.new(data.merge("id" => i))
    end
    ideas
	end

	def self.delete(position)
    database.transaction do
      database['ideas'].delete_at(position)
    end
  end

  def self.find(id)
  	raw_idea = find_raw_idea(id)
    Idea.new(raw_idea.merge("id" => id))
  end

  def self.find_raw_idea(id)
  	database.transaction do 
  		database['ideas'].at(id)
  	end
  end

  def self.update(id, data)
  	database.transaction do 
  		database['ideas'][id] = data
  	end
  end

  def self.create(attributes)
  	database.transaction do 
  		database['ideas'] << attributes
  	end
  end

  def self.search(phrase)
    all.find_all do |idea|
      idea.title.downcase.include?(phrase) || idea.description.downcase.include?(phrase)
    end
  end

  def self.tags
    all.flat_map(&:tags).uniq
  end

  def self.tag_ideas(tag_name)
    all.select {|idea| idea.tags.include?(tag_name)}
  end

  def self.categories
    all.map(&:category).uniq
  end

  def self.category_ideas(category_name)
    all.select {|idea| idea.category.include?(category_name)}
  end
end
