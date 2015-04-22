require './lib/header_converter'
require './lib/paragraph_converter'
require './lib/symbol_converter'

class Chisel
  attr_accessor :message
  def initialize(message)
    @message = File.readlines(ARGV[0])
  end

  def convert_to_html
    message.map do |line|
      if line.match(/^#/)
        HeaderConverter.new(line).convert_headers
      elsif line.match(/[*][*]/)
        SymbolConverter.new(line).convert_strong_tags
      elsif line.match(/[*]/)
        SymbolConverter.new(line).convert_em
      elsif line.include?('&')
        SymbolConverter.new(line).convert_ampersand_symbols
      elsif !line.match('#')
        ParagraphCoverter.new(line).open_p_tags
      else !line.match('#')
        ParagraphCoverter.new(line).close_p_tags
      end
    end
  end
end

chisel = Chisel.new(ARGV[0])
puts chisel.convert_to_html







# class Chisel < HeaderConverter
#   def initialize(text)
#     @text             = File.readlines(ARGV[0])
#     puts HeaderConverter.new(@text).convert_headers
#   end

# puts Chisel.new(@header_converter)

#   def convert
#     @text.map do |line|
#       if line.start_with?('#')
#         HeaderConverter.new(line).convert_headers
#       elsif line.start_with?('*')
#         SymbolConverter.new(line).convert_nested_tags
#       elsif line.include?('&') 
#         SymbolConverter.new(line).convert_ampersand_symbols
#       else
#         ParagraphConverter.new.open_p_tags
#       end
#     end
#   end
# end