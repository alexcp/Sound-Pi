require 'rubygems'
require 'sinatra'
 
set :environment, :production

require './assets'
require './app'
 
use Assets
run Sinatra::Application
