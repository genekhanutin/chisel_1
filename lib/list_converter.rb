class ListConverter
  attr_reader :element

  def initialize(element)
    @element = element
  end

  # def convert_list
  #   header.gsub!(/([\n])/) { |m| "<p>\n" }
  #   header.gsub(":", ":\n</p>")
  # end

  def convert_ul_items
    if element.start_with?("* ")
      element.gsub!(/[*] (.*)$/, "<li>\\1</li>")
    end
  end
end