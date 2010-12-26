require 'hasher'

class Command < Hasher
	@@prefix = 'screen -d -m -S '
	@@commands = {}
	attr_reader :id, :command

	def initialize command
		@command = command
		@id = hash
		@@commands[@id] = self
		@output = `#{@@prefix}#{@id} #{@command}`

		self
	end

	def kill
		`screen -X -S #{@id} quit`
		true
	end

	def url 
		"/kill/#{@id}"
	end

	def hash
		@hash ||= super
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
