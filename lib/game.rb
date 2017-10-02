class Game
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def self.zero_player_start
    self.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
  end

  def self.one_player_start
    puts "Would you like to be 'X' or 'O'? Please enter '1' for 'X' and '2' for 'O'"
    player_1 = gets.strip
    if player_1 == "1"
      puts "You are Player X!"
      self.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
    elsif player_1 == "2"
      puts "You are Player 0!"
      self.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
    end
  end

  def self.two_player_start
    puts "Player 1 is X and Player 2 is O"
    self.new
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  # TODO: create another method for other player
  def winner
    if current_player.marker == "X"
      return "O"
    else
      return "X"
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def play
    until over?
      turn
    end
    if won? 
      puts "Congratulations Player #{winner}, you won!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def turn
    current = current_player
    current_move = current_player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, current_player)
      @board.display
      puts ""
      puts "Player #{current.marker} made a move."
      puts ""
    else 
      puts "invalid"
      turn
    end
  end

  def anti_diagonal
    x = 0
    y = @board.cells.length - 1
    anti_diagonal_array = []
    (@board.cells.length).times do
      anti_diagonal_array << @board.cells[x][y]
      x += 1
      y -= 1
    end
    anti_diagonal_array
  end
  
  def anti_diagonal_winner
    if anti_diagonal.uniq.length == 1 &&
       anti_diagonal.first != ' '
      return anti_diagonal.first
    end
    nil
  end

  def diagonal_array
    x = 0
    y = @board.cells.length - 3
    diagonal_array = []
    (@board.cells.length).times do
      diagonal_array << @board.cells[x][y]
      x += 1
      y -= 1
    end
    diagonal_array
  end
  
  def diagonal_winner
    if diagonal_array.uniq.length == 1 &&
       diagonal_array.first != ' '
      return diagonal_array.first
    end
    nil
  end

  def won?

    # Can't possibly win before turn 5
    return false if @board.turn_count < 5

    # Check rows for winning combo 
    @board.cells.each           { |row| return true if row.all? { |sym| sym == "X" } }
    @board.cells.each           { |row| return true if row.all? { |sym| sym == "O" } }
    
    # Check columns for winning combo
    @board.cells.transpose.each { |col| return true if col.all? { |sym| sym == "X" } }
    @board.cells.transpose.each { |col| return true if col.all? { |sym| sym == "O" } }
    
    # Check diagonals
    if diagonal_winner
      return true 
    elsif anti_diagonal_winner
      return true
    end
    false
  end
end


