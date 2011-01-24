helpers do
  def build_files_list hash, key = '/'
    output = "<a class='dir' href='#'><img src='/images/folder.png'>#{key}</a><br /><div class='level'>"
    if hash.class == Hash
      hash.each do |key, item|
        if item.class == Hash
          output += build_files_list item, key
        else
          if item.class == String
            output += "<a class='file' href='#{item}'><img src='/images/mplayer.png' >#{key}</a><br />"
          end
        end
      end
    end

    output += '</div>'
  end
end
