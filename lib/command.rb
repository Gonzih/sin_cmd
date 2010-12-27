require 'digest/md5'

class Command
	@@commands = {}
	attr_reader :id, :command

	def initialize command
		@command = command
		@id = hash
		@@commands[@id] = self
		@pid = fork { exec @command }

		self
	end

	def kill message = 'TERM'
		Process.kill message, @pid
		Process.wait @pid
		true
	end

	def url 
		"/kill/#{@id}"
	end

	def hash
		@hash ||= Digest::MD5.hexdigest(@command + Command.list.length.to_s)
	end

	def self.kill id
		if @@commands[id].kill
			@@commands.delete id
		end
	end
	
	def self.list
		@@commands || {}
	end
end
