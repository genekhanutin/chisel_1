require './lib/header_converter'
require './lib/paragraph_converter'
require './lib/symbol_converter'
require './lib/list_converter'

class ChiselParser
  attr_accessor :text

  def initialize
    @text = File.readlines(ARGV[0])
  end

  def convert_symbols
    text.map do |line|
      SymbolConverter.new(line).convert_strong_tags
      SymbolConverter.new(line).convert_em
      SymbolConverter.new(line).convert_ampersand_symbols
    end
  end

  def convert_lists
    convert_symbols.map do |line|
      ListConverter.new(line).convert_ul_items
      ListConverter.new(line).convert_ol_items
    end
  end

  def convert_p_tags
    convert_lists.map do |line|
      ParagraphConverter.new(line).p_tags
    end
  end

  def convert_all
    convert_p_tags.map do |line|
      HeaderConverter.new(line).convert_headers
    end
  end
end