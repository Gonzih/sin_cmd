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
	@commands = Command.list
	haml :list
end
