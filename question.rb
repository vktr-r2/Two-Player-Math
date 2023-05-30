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