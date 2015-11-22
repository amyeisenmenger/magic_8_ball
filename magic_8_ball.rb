# Basic Objectives:
# ­ User inputs question
# ­ Computer outputs random answer
# ­ User inputs "QUIT"
# ­ Computer outputs a goodbye message and exits
# Bonus Objectives:
  # ­ ability to add more answers:
  # ­ via easter egg question ("add_answers")
  # ­ via script arguments (ruby magic_eight.rb add_answers)
  # ­ do not let them add the same answer if the eight ball already has that answer
# ­ ability to reset answers back to original bank (hint: think constants)
# ­   via easter egg question ("reset_answers")
# ­ ability to have eight ball print all answers
# ­   via easter egg question ("print_answers")
require 'pry'

qwt = -> { quit }
add = -> { add_answers }
print = -> { print_answers }
reset_1 = -> { reset_answers }

@commands = { 'quit'=> qwt, 'add_answers'=> add, 'print_answers'=> print, 'reset_answers'=> reset_1 } 

def greeting
  puts 'Welcome to Magic Eight Ball!'
end

def reset
  @answers = [
  'Absolutely!',
  'It will be so',
  'Perhaps',
  'Probably not...',
  'Unlikely',
  'Never!',
  'You cannot, sir, take from me anything',
  'Come, you are a tedious fool.',
  'The opposite is also true.',
  'Wear a monocle',
  'Struggle is what it means to be alive and free.',
  'Do not now look for the answers. They cannot now be given to you because you could not live them.',
  'Ask Google',
  'No one can advise and help you, no one.',
  'There is no “answer,” no cognitive solution, to the questions that self-destructive people put.',
  'Know when to quit and have a margarita.',
  'Your brain is as dry as the remainder biscuit after a voyage.',
  'The most infectious pestilence upon thee!'
]
end

def ask_question
  puts 'Ask a question to get an answer or type QUIT to exit the program:'
    @question = gets.strip.downcase
end

def quit
  puts 'Thank you for consulting Magic Eight Ball,
the answer to all your existential crises.
Please come again!'
  exit (0)
end

def response
  puts @answers.sample
end

def add_answers
  puts 'Success! How many new answers would you like to add?'
  how_many = gets.to_i
  how_many.times do 
    puts 'Enter your answer here:'
    new_answer = gets.strip
    if @answers.include? new_answer
      puts 'Sorry! We already have that answer.'
    else
      @answers << new_answer
      puts 'Answer added!'
    end
  end
end

def print_answers
  puts 'All available answers:'
  puts @answers
end

def reset_answers
  reset
  puts 'Answers Reset to Original Set'
end

def magic_eight_ball
  greeting
  first_arg = ARGV[0].strip if ARGV[0]
  ARGV.clear
  reset
  case first_arg
  when 'quit', 'add_answers', 'print_answers', 'reset_answers'
    @commands[first_arg].call
  end
  @question = ''
  while @question != 'quit'
    ask_question
    case @question
    when 'quit', 'add_answers', 'print_answers', 'reset_answers'
      @commands[@question].call
    else
      response
    end
  end
end

magic_eight_ball
