require './lib/header_converter'     # ~> LoadError: cannot load such file -- ./lib/header_converter
require './lib/paragraph_converter'
require './lib/symbol_converter'

class Chisel
  attr_accessor :message
  def initialize(message)
    @message = File.readlines(ARGV[0])
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
    # require 'pry' ; binding.pry

# class Chisel < HeaderConverter
#   def initialize(text)
#     @text             = File.readlines(ARGV[0])
#     puts HeaderConverter.new(@text).convert_headers
#   end

# puts Chisel.new(@header_converter)

# splat, double splat, & need to called on text all the time
# cannot have branches inside of if statement

  # def convert_to_html
  #   message.map do |line|
  #     if line.match(/^#/)
  #       HeaderConverter.new(line).convert_headers
  #     elsif line.match(/[*][*]/)
  #       SymbolConverter.new(line).convert_strong_tags
  #     elsif line.match(/[*]/)
  #       SymbolConverter.new(line).convert_em
  #     elsif line.match(/[&]/)
  #       SymbolConverter.new(line).convert_ampersand_symbols
  #     elsif line == "\n"
  #       ''
  #     else 
  #       !line.match(/^# *(.*?)$/)
  #       ParagraphCoverter.new(line).convert_p_tags
  #     #   ParagraphCoverter.new(line).open_p_tags
  #     # else !line.match('#')
  #     #    ParagraphCoverter.new(line).close_p_tags
  #     end
  #   end
  # end
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

# ~> LoadError
# ~> cannot load such file -- ./lib/header_converter
# ~>
# ~> /Users/genekhanutin/.rvm/rubies/ruby-2.1.5/lib/ruby/site_ruby/2.1.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/genekhanutin/.rvm/rubies/ruby-2.1.5/lib/ruby/site_ruby/2.1.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/genekhanutin/module_1/home_work/chisel_1/lib/chisel.rb:1:in `<main>'