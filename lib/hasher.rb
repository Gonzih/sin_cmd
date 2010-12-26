require 'digest/md5'

class Hasher
	def hash
		Digest::MD5.hexdigest @command
	end
end
