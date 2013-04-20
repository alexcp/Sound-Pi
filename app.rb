require 'sinatra'
require 'json'
require_relative 'config/db'
require_relative 'model/song'
require_relative 'model/album'
require_relative 'model/artist'

MUSIC_DIR = "/home/alex/Music"

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
