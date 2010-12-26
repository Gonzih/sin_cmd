require 'test/unit'
$: << File.join(File.dirname(__FILE__), '../lib')
require 'command'

class CommandTest < Test::Unit::TestCase
	def setup
		@command = Command.new 'notify-send "Launched by test"'
	end

	def test_run
		assert_kind_of Command, @command
		#puts "Did you see notification (write true/false)"
		#assert_equal 'true', gets.chomp
	end

	def test_commands_count
		assert_equal 1, Command.list.count
	end

	def test_commands_list_type
		assert_kind_of Hash, Command.list
	end

	def test_command_from_list_class_must_be_command
		assert_kind_of Command, Command.list.first[1]
	end

	def test_command_from_array_nand_them_hash
		assert_equal Command.list.first[0], Command.list.first[1].hash
	end

	def test_kill_xterm
		xterm = Command.new 'xterm'
		assert_equal 2, Command.list.count
		Command.kill xterm.id
		assert_equal 1, Command.list.count
		assert_equal '', `pidof xterm`
	end
end
