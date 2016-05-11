class GameLoop

  def initialize(game, screen)
    @game = game
    @screen = screen
  end

  def play
    begin
      @screen.clear
      @screen.display_title
      @screen.display_board
      play_move
    end until @game.game_over?
  end 

  private 

  def play_move
    if @game.is_current_player_ai?
      @game.play_move(@game.get_ai_player_move)
    else
      @game.play_move(@screen.get_input(@game.available_moves))
    end
  end
end
