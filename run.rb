#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'haml'

root = File.dirname __FILE__
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

post '/kill/:id' do
	Command.kill params[:id]
end
