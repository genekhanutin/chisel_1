require 'minitest/autorun'
require 'pry'

class Chisel
  def initialize(markdown)
    @markdown = markdown
  end

  def to_html
    @markdown.gsub(/^# *(.*?)$/, '<h1>\\1</h1>') << '\n'
  end
end

class IntegrationTest < Minitest::Test
  def to_html(markdown)
    Chisel.new(markdown).to_html
  end

  def test_h1
    html = to_html('# hello')
    assert_equal '<h1>hello</h1>\n', html
  end
end