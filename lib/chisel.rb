require './lib/chisel_parser'


class Chisel
  def convert_html
    ChiselParser.new.convert_all_headers    
  end
end
parser = Chisel.new.convert_html.join("")

html_file = File.open(ARGV[1], "w")
html_file << parser
html_file.close
