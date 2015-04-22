require 'minitest/autorun'
require './lib/header_converter'

class HeaderConverterTest < Minitest::Test
  def test_it_converts_to_h1_tags
    html = HeaderConverter.new('# My Life in Desserts')
    assert_equal '<h1>My Life in Desserts</h1>', html.convert_h1
  end  

  def test_it_converts_to_h2_tags
    html = HeaderConverter.new('## My Life in Desserts')
    assert_equal '<h2>My Life in Desserts</h2>', html.convert_h2
  end

  def test_it_converts_to_h3_tags
    html = HeaderConverter.new('### My Life in Desserts')
    assert_equal '<h3>My Life in Desserts</h3>', html.convert_h3
  end

  def test_it_converts_to_h4_tags
    html = HeaderConverter.new('#### My Life in Desserts')
    assert_equal '<h4>My Life in Desserts</h4>', html.convert_h4
  end

  def test_it_converts_to_h5_tags
    html = HeaderConverter.new('##### My Life in Desserts')
    assert_equal '<h5>My Life in Desserts</h5>', html.convert_h5
  end  

  def test_it_converts_any_header
    h1 = HeaderConverter.new('# My Life in Desserts')
    h2 = HeaderConverter.new('## My Life in Desserts')
    h3 = HeaderConverter.new('### My Life in Desserts')
    h4 = HeaderConverter.new('#### My Life in Desserts')
    h5 = HeaderConverter.new('##### My Life in Desserts')

    assert_equal '<h1>My Life in Desserts</h1>', h1.convert_headers
    assert_equal '<h2>My Life in Desserts</h2>', h2.convert_headers
    assert_equal '<h3>My Life in Desserts</h3>', h3.convert_headers
    assert_equal '<h4>My Life in Desserts</h4>', h4.convert_headers
    assert_equal '<h5>My Life in Desserts</h5>', h5.convert_headers
  end
end