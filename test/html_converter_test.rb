require 'minitest/autorun'
require './lib/html_converter'

class HtmlConverterTest < Minitest::Test
  
 

  def test_it_adds_opening_p_tag
    text   = "Here is some paragraph text"
    html   = HtmlConverter.new(text)
    output =  "<p>\nHere is some paragraph text"

    assert output, html.open_p_tags  
  end 

  def test_it_adds_closing_p_tags
   text   = 'Here is some paragraph text'
   html   = HtmlConverter.new(text) 
   output = 'Here is some paragraph text</p>'

   assert output, html.close_p_tags
  end
end

