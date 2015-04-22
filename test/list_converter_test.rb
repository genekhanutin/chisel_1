require 'minitest/autorun'
require './lib/list_converter'

class ListHeaderTest < MiniTest::Test
  def test_list_converter_exists
    assert ListConverter.new("Sample Text:")
  end

  def test_it_adds_li_tags
    html = ListConverter.new("* Sushi")

    assert_equal "<li>Sushi</li>", html.convert_list_items
  end  
end
