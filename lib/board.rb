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

  def taken?(input)
    cell = position(input)
    (cell == "X") || (cell == "O")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def turn_count
    cells.flatten.count{|marker| marker == "X" || marker == "O"}
  end

  # TODO: optimize this to variable grid
  def update(input, player)
    if input == "1" 
      cells[0][input.to_i-1] = player.marker
    elsif input == "2"
      cells[0][input.to_i-1] = player.marker
    elsif input == "3"
      cells[0][input.to_i-1] = player.marker
      
    elsif input == "4" 
      cells[1][input.to_i-4] = player.marker 
    elsif input == "5"
      cells[1][input.to_i-4] = player.marker 
    elsif input == "6"
      cells[1][input.to_i-4] = player.marker 

    elsif input == "7"
      cells[2][input.to_i-7] = player.marker
    elsif input == "8"
      cells[2][input.to_i-7] = player.marker
    else
      cells[2][input.to_i-7] = player.marker
    end
  end

  def full?
    @cells.flatten.all?{|marker| marker == "X" || marker == "O"}
  end
end
