class Rounds
  attr_accessor :lives_player_1, :lives_player_2, :current_player, :current_round, :player_1_wins, :player_2_wins
  attr_reader :questions

  def initialize(questions_instance)
    @questions = questions_instance
    @lives_player_1 = 3
    @lives_player_2 = 3
    @current_player = '1'
    @current_round = 1
    @player_1_wins = 0
    @player_2_wins = 0
  end

  def toggle_current_player
    if current_player ==  '1'
      self.current_player = '2'
    else
      self.current_player = '1'
    end
  end

  def take_life
    if current_player ==  '1'
      self.lives_player_1 -= 1
    else
      self.lives_player_2 -= 1
    end
  end

  def validate_answer(player_answer, answer)
    if player_answer == answer
      print "You got it right! \n"
      if current_player == '1'
        self.player_1_wins += 1
      else
        self.player_2_wins += 1
      end
    else
      print "Wrong player #{current_player}, you lose a life \n"
      self.take_life
    end
  end

  def get_player_number
    print "> Player #{current_player} pick a number: \n"
    player_number = $stdin.gets.chomp
    if player_number.match?(/[[:alpha:]]/)
      self.get_player_number
    end

    player_number = player_number.to_i
    
    unless (player_number >= 0) && (player_number < 20)
      self.get_player_number
    end
    player_number
  end

  def start_next_round
    if lives_player_1 == 0 || player_2_wins == 3
      print "You won player 2!"
      exit
    elsif lives_player_2 == 0 || player_1_wins == 3
      print "You won player 1!"
      exit
    else
      self.current_round += 1
      play_round
    end
  end

  def play_round
    if current_round == 1
      print "Would you like to play a (math) game? \n"
      print "Round #{current_round} \n"
      print "Player #{current_player}, you begin \n"
    else
      print "Round #{current_round} \n"
      print "P1: #{player_1_wins}/3 vs P2: #{player_2_wins}/3 \n"
    end
    print "Player #{current_player} your question is: \n What is " + "#{questions.get_random_question(self.get_player_number)}" + "\n"
    answer = questions.get_answer
    print "> Player #{current_player}, what is your answer: \n"
    player_answer = $stdin.gets.chomp
    self.validate_answer(player_answer, answer)
    self.toggle_current_player
    self.start_next_round
  end
  
end