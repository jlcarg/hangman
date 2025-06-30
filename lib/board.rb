class Board
  MIN_LETTERS = 5
  MAX_LETTERS = 12
  CHANCES = 7
  attr_accessor :secret_word, :guessed_letters, :chances, :correctly_guessed_letters, :incorrectly_guessed_letters

  def initialize
    @secret_word = select_secret_word
    @chances = CHANCES
    @correctly_guessed_letters = Array.new(@secret_word.length, '_')
    @incorrectly_guessed_letters = []
  end

  def filter_words
    File.open('google-10000-english-no-swears.txt', 'r') do |file|
      file.select { |word| word.length.between? MIN_LETTERS, MAX_LETTERS }
    end
  end

  def select_secret_word
    @secret_word = filter_words.sample.chomp.upcase.split('')
  end

  def already_guessed?(letter)
    @guessed_letters.include? letter
  end

  def letter_appears?(letter)
    @secret_word.include? letter
  end

  def count_letter_appearances(letter)
    @secret_word.count letter
  end

  def update_correctly_guessed!(letter_guessed)
    @secret_word.each_with_index do |letter, idx|
      @correctly_guessed_letters[idx] = letter_guessed if letter == letter_guessed
    end
    update_board
    puts "\nYou got a hit! #{letter_guessed} appears #{count_letter_appearances letter_guessed} time(s) in the secret word!"
  end

  def show_start_screen
    puts "Hangman in the console\nby jlcarg\n\n"
  end

  def update_board
    system('clear')
    show_start_screen
    puts "Can you guess it?\n#{@correctly_guessed_letters.join(' ')}"
    puts "\nWrong guesses:\n#{@incorrectly_guessed_letters.join(' ')}"
    puts "\nYou have #{@chances} chances left!"
  end

  def handle_player_guess(letter)
    update_board
    if letter_appears? letter
      update_correctly_guessed! letter
    else
      @incorrectly_guessed_letters << letter
      @chances -= 1
      update_board
      puts "Unfortunately, #{letter} doesn't appear in the secret word!"
    end
  end
end

# board = Board.new
# puts board.filter_words.length
# board.select_secret_word
# puts board.secret_word
# puts board.guessed_letters
# board.handle_player_guess('a')
