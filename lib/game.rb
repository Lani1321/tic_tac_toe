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
    if (@board.cells[0][0] == "X" || @board.cells[0][0] == "O") && (@board.cells[0][0] == @board.cells[1][1]) && (@board.cells[1][1] == @board.cells[2][2]) 
      return true 
    elsif (@board.cells[2][0] == "X" || @board.cells[2][0] == "O") && (@board.cells[2][0] == @board.cells[1][1]) && (@board.cells[1][1] == @board.cells[0][2])
      return true
    end
    false
  end
end


