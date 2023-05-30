=begin

DESCRIPTION:
Create a 2-Player math game where players take turns to answer simple math addition problems. 
A new math question is generated for each turn by picking two numbers between 1 and 20. 
The player whose turn it is is prompted the question and must answer correctly or lose a life.

DETAILS:
Both players start with 3 lives. They lose a life if they mis-answer a question. 
At the end of every turn, the game should output the new scores for both players, so players know where they stand.

The game doesn’t end until one of the players loses all their lives. At this point, the game should announce who 
won and what the other player’s score is.



PLAYER: This class represents an individual participant in the game. It holds attributes such as the player's 
name and remaining lives. Initialization will require setting the player's name and initial number of lives. 
The Player class can provide methods to handle losing a life and checking if the player is still in the game (has remaining lives).

TURN: This class manages a single round of the game for one player. It should be responsible for managing the interaction 
between the player and the question for that round. It may not need any specific data at initialization. 
Its main method could be to conduct the turn, which involves presenting a question to the player and handling the player's response.

GAME: This class manages the overall game logic, involving all turns and players. It keeps track of the 
players and whose turn it is, and it determines when the game is over (when a player loses all their lives). 
Initialization might involve setting up the players. The Game class will contain the main game loop, with each iteration 
representing a new turn. Public methods might include methods to start the game, to end the game, and to switch turns between players.

QUESTION: This class is responsible for generating math questions and verifying the answers. 
At initialization, it could randomly generate two numbers for the addition question. 
It should have methods to display the question and to check if an answer is correct.


In this setup, the Turn class could manage who the current_player is for that turn, 
while the Game class manages which player's turn it is. The Game class will still have the game loop, 
with each iteration creating a new Turn.


For user I/O, it may make sense for the Turn class to handle some I/O related to the specific question 
and answer for that turn, while the Game class handles I/O related to the overall game progression and result. 
This keeps the Player and Question classes focused on their own logic.

=end

class Player

  # attr_accessor establishes getter and setter methods by default
  attr_accessor :name, :lives
  
  # Player class gets initialized with two instance variables: name, lives
  def initialize(name)
    @name = name
    @lives = 3
  end

  # Method decrements @lives instance variable by 1 each time its called and returns message to use accordingly
  def lose_life
    @lives -= 1
    puts "#{name} has #{lives} lives remaining.  Good luck!" if @lives > 0
    puts "#{name} is out of lives!  GAME OVER!" if @lives === 0

  end
  
  # Method returns true if the player is out of lives
  def game_over
    @lives === 0
  end

end




class Question

  # Question OBJECT initialized with four instance variables: 
  # - two random numbers between 1-20 
  # - @correct_answer which is sum of two random numbers
  # - @user_answer initialized with 'nil' (will be set later by user input)
  def initialize
    @number_1 = rand(1..20)
    @number_2 = rand(1..20)
    @correct_answer = @number_1 + @number_2
    @user_answer = nil
  end

  # Method asks question to user, and receives user input
  def ask_question
    puts "What does #{@number_1} + #{@number_2} equal?"
    print "> "
    @user_answer = gets.chomp.to_i
    @user_answer
  end

  # Method returns true if answer argument matches @correct_answer
  def correct_answer(answer)
    answer  === @correct_answer
  end

end




class Turn

  # attr_accessor establishes getter and setter methods by default
  attr_reader :players, :question

  # Turn OBJECT initialized with two instance variables:
  # - @player set by player argument received when Turn object created
  # - @question set to equal a new question object (basically nesting objects)
  def initialize(player)
    @player = player
    @question = Question.new
  end
  
  # Method stores the input value (answer) from user.  If correct_answer returns true, then "Great job..", otherwise @player.lose_life
  def conduct_turn
    answer = @question.ask_question
    if @question.correct_answer(answer)
      puts "Great job guessing!"
    else
      @player.lose_life
    end
  end

end




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


# Create new Game object
new_game = Game.new
# Call .play_game method to trigger start
new_game.play_game

