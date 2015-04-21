class HtmlConverter
  attr_reader :text
  def initialize(text)
    @text = text
  end

  def open_p_tags
    if text.start_with? == text.match(/[\W]/)
      convert_headlines
    else
      text.gsub(/[\b]/, "<p>")
    end
  end

  def close_p_tags
    text.gsub(/[\n][\n]/, "\n</p>\n")
  end
end