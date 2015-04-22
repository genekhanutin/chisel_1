require './lib/header_converter'
require './lib/paragraph_converter'
require './lib/symbol_converter'

class Chisel
  attr_accessor :message

  def initialize(message)
    @message = File.read(ARGV[0]).split('\n')
  end

  def convert_symbols
    convert = message.each do |line|
      SymbolConverter.new(line).convert_strong_tags
      SymbolConverter.new(line).convert_em
      SymbolConverter.new(line).convert_ampersand_symbols
    end
  end

  def convert_all_headers
    convert = convert_symbols.each do |line|
      if line.match(/^#/)
        HeaderConverter.new(line).convert_headers
      end
    end
  end 
end

chisel = Chisel.new(ARGV[0])
puts chisel.convert_all_headers 