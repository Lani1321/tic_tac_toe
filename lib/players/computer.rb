module Players
  class Computer < Player
    def move(board)
      
      # Always go for the middle spot if it's available
      if board.cells[1][1] == " "
        move = "5"
      else
        move = Random.rand(9).to_s
      end
    end
  end
end
