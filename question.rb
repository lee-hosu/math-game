class Question
  def generate_question
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    "What does #{@num1} plus #{@num2} equal?"
  end

  def correct_answer?(answer)
    answer == @num1 + @num2
  end
end