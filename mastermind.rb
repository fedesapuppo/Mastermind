# frozen_string_literal: true

def put_greeting_message
  puts "Welcome to Mastermind! The computer has chosen a secret 4 digits code,
  with digits from 1 up to 4. Your mission is to discover such code.
  Try a different code each turn, untill you find the right one.
  You have 12 guesses to find it, or you'll loose the game.
  In order to help you win,  each turn you'll be provided with some information.
  Think well each of your moves!......Are you a MASTERMIND?"
end

def create_secret_code
  [1, 2, 3, 4].shuffle
end

def make_guess
  puts 'Please, enter a four digits number:'
  gets.chomp.split('').map(&:to_i)
end

def make_guess_invalid_input
  puts 'Invalid guess. Please, enter a four digits number from 1 trough 4'
  gets.chomp.split('').map(&:to_i)
end

def valid_guess?(guess)
  integers = guess.all? { |i| i.is_a?(Integer) }
  size = guess.size == 4
  have_letters = guess.include? 0
  integers && size && !have_letters
end

def put_win_message
  puts 'You guess is right. Well done! you are a mastermind!!'
end

def put_lose_message
  puts "You have no more guesses left. You've lost the game!!"
end

def put_right_guesses(secret_code, current_guess)
  right_guesses = 0
  secret_code.each_with_index do |_num, index|
    right_guesses += 1 if secret_code[index] == current_guess[index]
  end
  puts "Right guesses: #{right_guesses}"
end

def guesses_left?(number_of_guesses_left)
  number_of_guesses_left.positive?
end

def put_guesses_left(number_of_guesses_left)
  puts "Guesses left: #{number_of_guesses_left}"
end

def play_game
  put_greeting_message
  number_of_guesses_left = 12
  secret_code = create_secret_code
  current_guess = [0, 0, 0, 0]
  until secret_code == current_guess || number_of_guesses_left.zero?
    current_guess = make_guess
    current_guess = make_guess_invalid_input until valid_guess? current_guess
    if secret_code == current_guess
      put_win_message
    else
      number_of_guesses_left -= 1
      if guesses_left? number_of_guesses_left
        put_guesses_left number_of_guesses_left
        put_right_guesses secret_code, current_guess
      else
        put_lose_message
      end
    end
  end
end

play_game
