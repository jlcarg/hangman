class Board
  MIN_LETTERS = 5
  MAX_LETTERS = 12
  attr_accessor :secret_word, :guessed_letters

  def initialize
    @secret_word = select_secret_word
    @guessed_letters = []
  end

  def filter_words
    File.open('google-10000-english-no-swears.txt', 'r') do |file|
      file.select { |word| word.length.between? MIN_LETTERS, MAX_LETTERS }
    end
  end

  def select_secret_word
    @secret_word = filter_words.sample
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

  def handle_player_guess(letter)
    if already_guessed? letter
      puts "You have already guessed #{letter}, try another letter!"
    else
      @guessed_letters << letter
      if letter_appears? letter
        puts "You got a hit! #{letter} appears #{count_letter_appearances letter} time(s) in the secret word!"
      else
        puts "Unfortunately, #{letter} doesn't appear in the secret word!"
      end
    end
  end
end

board = Board.new
puts board.filter_words.length
board.select_secret_word
puts board.secret_word
puts board.guessed_letters
board.handle_player_guess('a')
