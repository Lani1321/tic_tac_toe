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
    puts "Who should go first? Please enter '1' for the human player or '2' for the computer"
    first_player = gets.strip
    if first_player == "1"
      puts "You are Player X!"
      self.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
    elsif first_player == "2"
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
end


