class Player
  attr_reader :token

  # Token is "X" or "O"
  def initialize(token)
    @token = token
  end
end
