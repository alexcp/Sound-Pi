require 'rubygems'
require 'sinatra'
require './assets'
require './app'
 
use Assets
run Sinatra::Application
