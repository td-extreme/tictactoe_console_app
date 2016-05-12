require 'tictactoe'
require 'game_screen'
require 'game_loop'
require 'game_setup'
require 'wrapper_stdio'

class TerminalTicTacToe

  def initialize
    @screen = GameScreen.new(WrapperStdio.new)
  end

  def play_game
    game_loop = GameLoop.new(@game, @screen)
    game_loop.play
    end_of_game
  end

  def end_of_game
    @screen.clear
    @screen.display_title
    @screen.display_board(@game.get_board)
    @game.tied_game? ? @screen.display_tied : @screen.display_winner(@game.winner) 
  end

  def setup
    game_setup = GameSetup.new(@screen)
    @player1, @player2 = game_setup.setup
    @game = TicTacToe.new(@player1, @player2)
  end
end
