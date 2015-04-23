class ListConverter
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def convert_ul_items
    tag_count = 0
    if text.start_with?("* ")
      text.gsub!(/[*] (.*)$/, "<li>\\1</li>")
    end
  end

  def convert_ol_items
    tag_count = 0
    if text.scan(/^[0-9]./)
      text.gsub!(/^[0-9]. (.*)$/, "<li>\\1</li>")
    end
  end  
end


  # def convert_list
  #   header.gsub!(/([\n])/) { |m| "<p>\n" }
  #   header.gsub(":", ":\n</p>")
  # end