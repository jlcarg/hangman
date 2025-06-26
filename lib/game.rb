require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @player = Player.new
  end

  def play
    puts @board.secret_word
    @player.take_guess
    @board.handle_player_guess @player.guessed_letters[-1]
  end
end

game = Game.new
game.play
