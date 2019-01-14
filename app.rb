require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './models/game'
also_reload('./models/*')

get '/' do
  erb(:welcome)
end

get '/rules' do
  erb(:rules)
end

get '/result' do
  erb(:result)
end

get '/play/:player1/:player2' do
  game = Game.new(params[:player1].to_s, params[:player2].to_s)
  @result = game.play
  erb(:result)
end
