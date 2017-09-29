class Player
  attr_reader :marker

  # Marker is "X" or "O"
  def initialize(marker)
    @marker = marker
  end
end
