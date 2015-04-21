class HeaderConverter
attr_reader :text

  def initialize(text)  
    @text = text
  end

  def convert_headers
    if text.scan(/#/).count == 5
      convert_h5
    elsif text.scan(/#/).count == 4
      convert_h4
    elsif text.scan(/#/).count == 3
      convert_h3
    elsif text.scan(/#/).count == 2
      convert_h2
    else text.scan(/#/).count == 1
      convert_h1
    end
  end

  def convert_h1
    text.gsub(/^# *(.*?)$/, '<h1>\\1</h1>') << '\n'
  end

  def convert_h2
    text.gsub(/^## *(.*?)$/, '<h2>\\1</h2>') << '\n'
  end

  def convert_h3
    text.gsub(/^### *(.*?)$/, '<h3>\\1</h3>') << '\n'
  end

  def convert_h4
    text.gsub(/^#### *(.*?)$/, '<h4>\\1</h4>') << '\n'
  end

  def convert_h5
    text.gsub(/^##### *(.*?)$/, '<h5>\\1</h5>') << '\n'
  end
end