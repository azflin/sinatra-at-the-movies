require 'sinatra'
require_relative 'models/movie'

#homepage
get '/' do 
	"Movie Review Home Page"
end

# Create route to show all movies
get '/movies' do
	@movies = Movie.all
	erb :movies
end

# Create route to show form for a new movie
get '/movies/new' do 
	erb :new 
end

# Create route to create a new movie when form is submitted
post '/movies' do
	Movie.create({:title=>params[:movie], :director=>params[:director], :rating=>params[:rating]})
	redirect "/movies"
end

# Create route to show one specific movie by ID
get '/movies/:id' do
	@movie = Movie.find(params[:id].to_i)
	erb :single_movie
end

# Create route to show form to edit one specific movie
get '/movies/:id/edit' do
	@movie = Movie.find(params[:id].to_i)
	erb :edit_movie
end

# Create route to update movie when edit form is submitted
patch '/movies/:id' do
	@movie = Movie.find(params[:id].to_i)
	@movie.title = params[:title]
	@movie.director = params[:director]
	@movie.rating = params[:Rating]
	redirect "/movies/" + params[:id]
end

# Create route to delete a movie 
delete '/movies/:id' do
	@movie = Movie.find(params[:id].to_i)
	@movie.destroy
	redirect "/movies"
end



