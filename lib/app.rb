require 'idea_box'

class IdeaBoxApp < Sinatra::Base
	set :method_override, true
	set :root, 'lib/app'

	configure :development do
    register Sinatra::Reloader
  end

	not_found do
	  erb :error
	end

	get '/' do 
		erb :index, locals: {ideas: IdeaStore.all.sort, idea: Idea.new(params)}
	end

	post '/' do
		IdeaStore.create(params[:idea])
	  redirect '/'
	end

	get '/all_ideas' do 
		erb :all_ideas, locals: {ideas: IdeaStore.all.sort, idea: Idea.new(params)}
	end

	get '/results' do 
		search_results = IdeaStore.search(params[:phrase])
		erb :results, locals: {search_results: search_results}
	end

	delete '/:id' do |id|
	  IdeaStore.delete(id.to_i)
	  redirect '/'
	end

	get '/:id/edit' do |id|
		idea = IdeaStore.find(id.to_i)
		erb :edit, locals: {idea: idea}
	end

	put '/:id' do |id|
		IdeaStore.update(id.to_i, params[:idea])
		redirect '/'
	end

	post '/:id/like' do |id|
	  idea = IdeaStore.find(id.to_i)
	  idea.like!
	  IdeaStore.update(id.to_i, idea.to_h)
	  redirect '/'
	end				
end