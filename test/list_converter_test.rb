require 'minitest/autorun'
require './lib/list_converter'

class ListHeaderTest < MiniTest::Test
  def test_list_converter_exists
    assert ListConverter.new("Sample Text:")
  end

  def test_it_adds_li_tags
    html = ListConverter.new("* Sushi\n* Tempura\n* Yakitori\n")

    assert_equal "<ul>\n<li>Sushi</li>\n<li>Tempura</li>\n<li>Yakitori</li>\n</ul>", html.convert_ul_items
  end  

  def test_it_adds_li_tags
    html = ListConverter.new("1. Sushi\n2. Barbeque\n3. Mexican\n")

    assert_equal "<ol>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ol>", html.convert_ol_items
  end  
end
