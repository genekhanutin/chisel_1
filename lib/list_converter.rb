class ListHeader
  attr_reader :header
  def initialize(header)
    @header = header
  end
  def convert_list
    header.gsub!(/([\n])/) { |m| "<p>\n" }
    header.gsub(":", ":\n</p>")
  end
end