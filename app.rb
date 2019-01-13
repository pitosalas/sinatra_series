require 'sinatra'
require "sinatra/activerecord"
require 'byebug'
require_relative "models/user"

get '/' do
  "Hello Sinatra!"
end
