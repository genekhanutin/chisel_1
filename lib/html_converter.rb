class HtmlConverter
  attr_reader :text
  def initialize(text)
    @text = text
  end
  def convert_em
    text.gsub!(/[*]\b/, '<em>')
    text.gsub(/\b[*]/, '</em>')
  end

  def convert_strong_tags
    text.gsub!(/[*][*]\b/, '<strong>')
    text.gsub(/\b[*][*]/, '</strong>')
  end

  def convert_ampersand_symbols
    text.gsub(/&/, '&amp;')
  end

  def convert_nested_tags
    text.gsub!(/[*][*]\b/, '<strong>')
    text.gsub!(/\b[*][*]/, '</strong>')
    convert_em
  end
end