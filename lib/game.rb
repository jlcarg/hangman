require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :board, :player

  def initialize
    @board = Board.new
    @player = Player.new
    p @board.secret_word
  end

  def play
    @player.take_guess
    @board.handle_player_guess(@player.guessed_letters[-1])
    p @board.chances
  end

  def game_over?
    @board.secret_word == @board.correctly_guessed_letters || @board.chances.zero?
  end

  def show_secret_word
    puts "The secret word was: #{@board.secret_word}"
  end

  def start
    play until game_over?
    if @board.chances.zero?
      puts "You Lose!\n"
    else
      puts "Congratulations! You Won!\n"
    end
    show_secret_word
  end
end

game = Game.new
game.start
