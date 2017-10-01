class Board
  attr_accessor :cells

  def initialize           
    @cells = Array.new(3) { Array.new(3) {" "}}
  end

  def display
    puts "\n"      
    puts " #{cells[0][0]} | #{cells[0][1]} | #{cells[0][2]} "
    puts "-----------"
    puts " #{cells[1][0]} | #{cells[1][1]} | #{cells[1][2]} "
    puts "-----------"
    puts " #{cells[2][0]} | #{cells[2][1]} | #{cells[2][2]} "
  end

  def position(input)
    if input == "1" || "2" || "3"
      @cells[0][input.to_i - 1]
    elsif input == "4" || "5" || "6"
      @cells[1][input.to_i - 1]
    else
      @cells[2][input.to_i - 1]
    end
  end

  
end
