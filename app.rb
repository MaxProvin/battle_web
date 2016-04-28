require 'sinatra/base'
require './lib/player'
require './lib/game'
class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/death' do
    erb(:death)
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.not_current_player)
    if @game.game_over?
      redirect '/death'
    end
    @game.switch
    erb :attack
  end

  # # start the server if ruby file executed directly
  run! if app_file == $0
end
