class TerminalTicTacToe

  def initialize(game, game_loop, game_screen)
    @game = game
    @game_loop = game_loop
    @game_screen = game_screen 
  end

  def play_game
    game_loop.play
    end_of_game
  end

  def end_of_game
    game_screen.clear
    game_screen.display_title
    game_screen.display_board(game.get_board)
    game.tied_game? ? game_screen.display_tied : game_screen.display_winner(game.winner) 
  end

  private
  attr_accessor :game, :game_loop, :game_screen
end
