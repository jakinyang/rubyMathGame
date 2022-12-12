require './questions.rb'
require './rounds.rb'
require './mathquestionseeds.rb'

math_questions = [
  '8 / 4',
  '7 x 9',
  '49 + 56',
  '9 x 11',
  '14 x 4',
  '16 - 4',
  '9 x 13',
  '4 + 20', 
  '13 x 10',
  '4 x 8',
  '4 + 8',
  '2 x 17',
  '3 x 6',  
  '6 x 15', 
  '12 + 12',
  '3 x 3 x 3',
  '6 x 8',
  '5 x 5',
  '10 x 20',
  '11 x 12'
]

math_answers = [
  '2', 
  '63', 
  '105', 
  '99', 
  '56', 
  '12', 
  '117', 
  '24', 
  '130', 
  '32', 
  '12', 
  '34', 
  '18', 
  '90', 
  '24', 
  '27', 
  '48', 
  '25', 
  '200', 
  '132'
]

questions = Questions.new(math_questions, math_answers)
rounds = Rounds.new(questions)

p '-------------------'
p 'Getting all the questions'
p questions.questions

p '-------------------'
p 'Getting current active index'
p questions.active_index

p '-------------------'
p 'Getting random question'
p questions.get_random_question(20)

p '-------------------'
p 'Getting new active index'
p questions.active_index

p '-------------------'
p 'Getting answer to question'
p questions.get_answer

p '-------------------'
p 'Starting game'
p rounds.play_round


