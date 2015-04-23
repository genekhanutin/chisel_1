class ParagraphConverter
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def p_tags
      if text.match(/^[a-zA-Z][^\n]/)
        text.gsub!(/^[a-zA-Z][^\n] *(.*?)$/, "\n<p>\n\\0\n</p>")
      else text.match(/^["]/)
        text.gsub!(/^["] *(.*?)$/, "\n<p>\n\\0\n</p>")
      end
  end
end