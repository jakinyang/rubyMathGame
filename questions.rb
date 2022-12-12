class Questions
  attr_accessor :questions, :answers, :active_index
  def initialize(questions, answers)
    @questions = questions
    @answers = answers
    @active_index = 0
  end

  def get_random_question(number)
    self.active_index = rand(number.to_i)
    questions[active_index]
  end
  
  def get_answer
    answers[active_index]
  end
end