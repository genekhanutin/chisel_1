require 'minitest/autorun'
require './lib/list_converter'

class ListHeaderTest < MiniTest::Test
  def test_list_converter_exists
    assert ListHeader.new("Sample Text:")
  end

  def test_it_converts_list_header
    list = ListHeader.new("\nSample Text:")
    assert_equal "<p>
Sample Text:
</p>", list.convert_list
  end
  
end