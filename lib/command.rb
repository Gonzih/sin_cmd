require 'hasher'

class Command < Hasher
	@@prefix = 'screen -d -m -S '
	@@commands = {}

	def initialize command
		@command = command
		@id = hash
		@@commands[@id] = self
		@output = `#{@@prefix}#{@id} #{@command}`
	end

	def kill
		`screen #{@id} kill`
	end

	def hash
		@hash ||= super
	end

	def self.kill id
		if @@commands[id].kill
			@@commands[id] = nil
		end
	end
end
