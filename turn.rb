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