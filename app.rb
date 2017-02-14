require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection.rb'

require_relative 'models/pokemon'

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :"pokemons/index"

end

get '/pokemons/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/edit"

end

put '/pokemons/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  erb :"pokemons/edit"
  redirect("/pokemons/#{pokemon.id}")
  
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



delete '/pokemons/:id/edit' do
  @pokemon = pokemon.find(params[:id])
  @pokemon.delete
  
  erb :"pokemons/edit"
  redirect('/pokemons')
end
