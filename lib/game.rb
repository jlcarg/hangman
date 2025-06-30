require_relative 'board'
require_relative 'player'
require_relative 'save_load_menu'

class Game
  attr_accessor :board, :player

  def initialize(board = Board.new, player = Player.new)
    @board = board
    @player = player
  end

  def play
    @board.update_board
    @player.take_guess
    @board.handle_player_guess(@player.guessed_letters[-1])
  end

  def game_over?
    @board.secret_word == @board.correctly_guessed_letters || @board.chances.zero?
  end

  def show_secret_word
    puts "The secret word was: #{@board.secret_word.join('')}"
  end

  def declare_result
    if @board.chances.zero?
      puts "\nYou Lose!\n"
    else
      puts "\nCongratulations! You Won!\n"
    end
    show_secret_word
  end

  def start
    until game_over?
      puts 'Type SAVE for saving your game and exiting or Press Enter to continue'
      answer = gets.chomp
      return SaveLoadMenu.save_game(self) if answer == 'SAVE'

      play
    end
    declare_result
  end
end
