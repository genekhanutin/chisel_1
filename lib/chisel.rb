require './lib/header_converter'
require './lib/paragraph_converter'
require './lib/symbol_converter'
require './lib/list_converter'

class Chisel
  attr_accessor :text

  def initialize
    @text = File.read(ARGV[0]).split("\n")
  end

  def convert_symbols
    text.each do |line|
      SymbolConverter.new(line).convert_strong_tags
      SymbolConverter.new(line).convert_em
      SymbolConverter.new(line).convert_ampersand_symbols
      ListConverter.new(line).convert_ul_items
      ListConverter.new(line).convert_ol_items
    end
  end

  def convert_all_headers
    convert_symbols.each do |line|
      HeaderConverter.new(line).convert_headers
    end
  end 
end

chisel = Chisel.new
puts chisel.convert_all_headers 

html_file = File.open(ARGV[1], "w")
html_file << chisel.convert_all_headers.join("\n")
html_file.close