require './lib/header_converter'

class Chisel < HeaderConverter
  def initialize(text)
    @text = File.read(ARGV[0])  
  end
end

chisel = Chisel.new(@text)
puts chisel.


# puts handle.class


