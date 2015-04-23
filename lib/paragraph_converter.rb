class ParagraphConverter
  attr_reader :text

  def initialize(text)
    @text = text
  end

  # def open_p_tags
  #   if text.start_with? == text.match(/[\W]/)
  #     convert_headlines
  #   else
  #     text.gsub(/[\b]/, "<p>")
  #   end
  # end

  # def close_p_tags
  #   text.gsub(/[\n][\n]/, "\n</p>\n")
  # end

  # def convert_p_tags
  #   if !text.match(/^# *(.*?)$/)
  #     text.gsub(/^ *(.*?)$/, '<p>\\1</p>')
  #   end
  # end

  def p_tags
      if text.match(/^[a-zA-Z][^\n]/)
        text.gsub!(/^[a-zA-Z][^\n] *(.*?)$/, "\n<p>\n\\0\n</p>")
      else text.match(/^["]/)
        text.gsub!(/^["] *(.*?)$/, "\n<p>\n\\0\n</p>")
      end
  end
end