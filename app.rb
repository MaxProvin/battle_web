require 'sinatra/base'

class Battle < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/names' do
    @Player1 = params[:Player1name]
    @Player2 = params[:Player2name]
    erb(:play)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end