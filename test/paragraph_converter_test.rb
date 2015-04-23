require 'minitest/autorun'
require './lib/paragraph_converter'

class ParagraphConverterTest < Minitest::Test
  def test_it_adds_opening_p_tag
    text   = "Here is some paragraph text"
    html   = ParagraphConverter.new(text)
    output =  "<p>\nHere is some paragraph text\n</p>"

    assert output, html.p_tags  
  end 

  def test_it_adds_closing_p_tags
   text   = 'Here is some paragraph text'
   html   = ParagraphConverter.new(text) 
   output = "<p>\nHere is some paragraph text\n</p>"

   assert output, html.p_tags
  end
end

