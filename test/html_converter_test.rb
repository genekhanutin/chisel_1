require 'minitest/autorun'
require './lib/html_converter'

class HtmlConverterTest < Minitest::Test
  
  def test_it_converts_to_em_tags
    html = HtmlConverter.new('You just *have* to try the cheesecake,')

    assert_equal 'You just <em>have</em> to try the cheesecake,', html.convert_em
  end  

  def test_it_converts_to_strong_tags
    html = HtmlConverter.new('Ever since it appeared in **Food & Wine** this place has been packed every night.')

    assert_equal 'Ever since it appeared in <strong>Food & Wine</strong> this place has been packed every night.', html.convert_strong_tags
  end

  def test_it_can_convert_strong_tags_within_em_tags
    html = HtmlConverter.new('My *emphasized and **stronged** text* is awesome.')

    assert_equal 'My <em>emphasized and <strong>stronged</strong> text</em> is awesome.', html.convert_nested_tags
  end  

  def test_it_converts_ampersand_symbols
    html = HtmlConverter.new('Ever since it appeared in **Food & Wine** this place has been packed every night.')

    assert_equal 'Ever since it appeared in **Food &amp; Wine** this place has been packed every night.', html.convert_ampersand_symbols
  end

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

