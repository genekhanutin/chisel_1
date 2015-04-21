require './lib/header_converter'

class Chisel < HeaderConverter
  def initialize(text)
    @text             = File.readlines(ARGV[0])
    puts HeaderConverter.new(@text).convert_headers
  end
end

puts Chisel.new(@header_converter)

def convert
  @text.each do |line|
    if line.start_with?('#')
      HeaderConverter.new(line).convert_headers
    elsif line.start_with?('*')
      line.SymbolConverter.new(line).convert_symbols 
end

# something like this ^^^
# basically once we have them all split up into classes
# we need to create a new instance of that class in this conditional
# to call the appropriate methods
# if we call convert_headers for example becuase the line starts with '#'
# the convert_headers method will then sort out which headers tags to apply
# also Jeff Gu said that itll be better if use 'readlines' instead of 
# 'read' because we can iterate over each line and apply the logic above
