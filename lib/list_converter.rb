class ListConverter
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def convert_ul_items
  # require 'pry' ; binding.pry 
    if text.start_with?("* ")
      "<ul>\n" + text.gsub!(/\* (.+)/,"<li>\\1</li>") + "\n</ul>\n"
    else
      text
    end
  end

  def convert_ol_items
    if text[0].to_i > 0
      "<ol>\n" + text.gsub(/^\d+\. (.+)/,"<li>\\1</li>") + "</ol>"
    else
      text
    end
  end
end
  # def convert_ul_items
  #   if text.start_with?("* ")
  #     text.gsub!(/[*] (.*)$/, "<li>\\1</li>")
  #   end
  # end

  # def convert_ol_items
  #   tag_count = 0
  #   if text.scan(/^[0-9]./)
  #     text.gsub!(/^[0-9]. (.*)$/, "<li>\\1</li>")
  #   end
  # end  