require 'minitest/autorun'
require './lib/html_converter'

class HtmlConverterTest < Minitest::Test
  def test_it_converts_to_h1_tags
    html = HtmlConverter.new('# My Life in Desserts')
    assert_equal '<h1>My Life in Desserts</h1>\n', html.convert_h1
  end  

  def test_it_converts_to_h2_tags
    html = HtmlConverter.new('## My Life in Desserts')
    assert_equal '<h2>My Life in Desserts</h2>\n', html.convert_h2
  end

  def test_it_converts_to_h3_tags
    html = HtmlConverter.new('### My Life in Desserts')
    assert_equal '<h3>My Life in Desserts</h3>\n', html.convert_h3
  end

  def test_it_converts_to_h4_tags
    html = HtmlConverter.new('#### My Life in Desserts')
    assert_equal '<h4>My Life in Desserts</h4>\n', html.convert_h4
  end

  def test_it_converts_to_h5_tags
    html = HtmlConverter.new('##### My Life in Desserts')
    assert_equal '<h5>My Life in Desserts</h5>\n', html.convert_h5
  end  

  def test_it_converts_any_header
    h1 = HtmlConverter.new('# My Life in Desserts')
    h2 = HtmlConverter.new('## My Life in Desserts')
    h3 = HtmlConverter.new('### My Life in Desserts')
    h4 = HtmlConverter.new('#### My Life in Desserts')
    h5 = HtmlConverter.new('##### My Life in Desserts')

    assert_equal '<h1>My Life in Desserts</h1>\n', h1.convert_headers
    assert_equal '<h2>My Life in Desserts</h2>\n', h2.convert_headers
    assert_equal '<h3>My Life in Desserts</h3>\n', h3.convert_headers
    assert_equal '<h4>My Life in Desserts</h4>\n', h4.convert_headers
    assert_equal '<h5>My Life in Desserts</h5>\n', h5.convert_headers
  end

  def test_it_converts_to_em_tags
    html = HtmlConverter.new('You just *have* to try the cheesecake,')

    assert_equal 'You just <em>have</em> to try the cheesecake,', html.convert_em
  end  

  def test_it_converts_to_strong_tags
    html = HtmlConverter.new('Ever since it appeared in **Food & Wine** this place has been packed every night.')

    assert_equal 'Ever since it appeared in <strong>Food & Wine</strong> this place has been packed every night.', html.convert_strong_tags
  end  
end

