require 'sinatra'
require 'json'
require_relative 'config/db'
require_relative 'model/song'
require_relative 'model/album'
require_relative 'model/artist'
require_relative 'player'

MUSIC_DIR = "/home/alex/Music"

PLAYER = Player.new

configure do
  enable :sessions
  set :root, File.dirname(__FILE__)
  set :public_folder, Proc.new { File.join(root, "public") }
  set :views, Proc.new { File.join(root, "views") }
end

get "/" do
  @songs = Song.all
  erb :index
end

get "/artists/:artist_id" do
  @songs = Artist.find(id: params[:artist_id]).albums.map{|album| album.songs}.flatten
  erb :index
end

get "/albums/:album_id" do
  @songs = Album.find(id: params[:album_id]).songs
  erb :index
end

get "/start" do
  PLAYER.start
end

get "/stop" do
  PLAYER.stop
end

post "/queue" do
  PLAYER << Song.find(id: params[:song_id])
  PLAYER.start
  200
end

get "/queue" do
  PLAYER.queue
end
