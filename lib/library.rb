require 'yaml'

class Library
  @@command = 'locate'

  def self.get_array types
    raise 'Empty types' if types.length == 0
    types = types.split(',')
    out = ''
    types.each { |s| s.gsub!(' ', ''); out += `#{@@command} #{s}` }

    out.split "\n"
  end

  def self.get_hash array
    tree_block = lambda{|h, k| h[k] = Hash.new(&tree_block) }
    out = Hash.new(&tree_block)
    array.each do |file|
      tmp = out
      path = file.split '/'
      path.each_index do |i|
        folder = path[i].to_s
        if i < path.length - 1
          tmp = tmp[folder] if folder.length > 0
        else
          tmp[folder] = file
        end
      end
    end

    out
  end
end
