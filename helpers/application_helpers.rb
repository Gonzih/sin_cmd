helpers do
  def build_files_list hash, key = '/'
    output = "<a class='dir' href='#'>#{key}</a><br /><div class='level'>"
    if hash.class == Hash
      hash.each_key do |key|
        if hash[key].class == Hash
          output += build_files_list hash[key], key
        else
          if hash[key].class == String
            output += "<a class='file' href='#{hash[key]}'>#{key}</a><br />"
          end
        end
      end
    end

    output += '</div>'
  end
end
