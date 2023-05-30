class Game
  
  # Initialize game with two player objects, and a 'current_player' instance variable
  def initialize
    @player_1 = Player.new("player1")
    @player_2 = Player.new("player2")
    @current_player = @player_1
  end

  # Method checks who current player is and then switches them
  def switch_player
    @current_player === @player_1? @current_player = @player_2 : @current_player = @player_1
  end

  # Method prints the score by displaying player_x.lives remaining
  def score
    puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
  end

  # Method checks if either player has player_x.game_over set to true
  def game_over
    @player_1.game_over || @player_2.game_over
  end

  # Method controls the game via loop
  def play_game
    puts "Welcome to Two Player Math"
    # Continue to loop until self.game_over is true
    loop do
      # Create new Turn object and call conduct_turn method
      Turn.new(@current_player).conduct_turn
      # Switch the player after each turn
      self.switch_player
      # Display the score after each turn
      self.score
    break if self.game_over
      # After game is over, declare the winner
      if @player_1.lives === 0
        puts 'Player 2 in the winner'
      elsif @player_2.lives === 0
        puts 'Player 1 is the winner'
      end
    end
  end
end