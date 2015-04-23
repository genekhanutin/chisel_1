class ListConverter
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def convert_ul_items
    if text.start_with?("*")
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