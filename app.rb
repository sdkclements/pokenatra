require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection.rb'

require_relative 'models/pokemon'


get '/' do
redirect ("/pokemons")
end

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :"pokemons/index"

end

get '/pokemons/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/edit"

end



put '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect("/pokemons/#{@pokemon.id}")

end

delete '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.delete
  redirect('/pokemons')
end

get'/pokemons/new' do
  erb :"pokemons/new"
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end



post '/pokemons' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"

end
