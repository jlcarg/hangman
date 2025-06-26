class Player
  attr_accessor :player_name, :guessed_letters

  def initialize
    @player_name = ask_player_name
    @guessed_letters = []
  end

  def ask_player_name
    puts 'What is your name?'
    gets.chomp
  end

  def not_guessed_yet?(letter)
    # add ! so when a letter has already been guessed it returns false to the answer has this letter NOT been guessed?
    !@guessed_letters.include? letter
  end

  def guess_is_letter?(letter)
    ('a'..'z').include? letter.downcase
  end

  def valid_guess?(letter)
    guess_is_letter?(letter) && not_guessed_yet?(letter)
  end

  def ask_guess
    puts "\nTake a guess! Type one letter from A-Z"
    gets.chomp.upcase
  end

  def reject_guess(guess)
    puts "\nThat is not a letter of the alphabet!" unless guess_is_letter? guess
    puts "\nYou already guessed #{guess}, try typing a new letter!" unless not_guessed_yet? guess
  end

  def take_guess
    guess = ''
    until valid_guess? guess
      letter = ask_guess
      if valid_guess? letter
        guess = letter
      else
        reject_guess letter
      end
    end
    @guessed_letters << guess
  end
end
