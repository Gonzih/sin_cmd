#!/usr/bin/env ruby
require 'rubygems'
require 'bundler'
require 'sinatra'
Bundler.require :default

root = File.dirname __FILE__
set :root, root
set :public, File.join(root, 'public')
$: << File.join(root, 'lib')
require 'command'

set :port, 4444

root = File.dirname __FILE__
set :views, File.join(root, 'views')

['/', '/list/?'].each do |path|
  before path do
    @commands = Command.list unless params[:cmd]
  end
end

before '/*' do
  use Rack::Auth::Basic do |username, password|
    username == 'test' && password == 'test'
  end
end


get '/' do
  haml :index
end

post '/run/?' do
  Command.new params[:cmd]

  'ok'
end

post '/kill/:id/?' do
  Command.kill params[:id]
  
  'ok'
end

post '/list/?' do
  haml :list, :locals => { :commands => @commands }, :layout => false
end
