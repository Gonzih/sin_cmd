#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'haml'

root = File.dirname __FILE__
set :root, root
set :public, File.join(root, 'public')
$: << File.join(root, 'lib')
require 'command'

root = File.dirname __FILE__
set :views, File.join(root, 'views')

before '/*' do
	@commands = Command.list unless params[:cmd]
end

get '/' do
	haml :index
end

post '/run/' do
	Command.new params[:cmd]
	#:ok
end

get '/kill/:id' do
	Command.kill params[:id]
end

get '/list/' do
	haml :list, :locals => { :commands => @commands }, :layout => false
end
