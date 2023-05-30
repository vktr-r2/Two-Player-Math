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