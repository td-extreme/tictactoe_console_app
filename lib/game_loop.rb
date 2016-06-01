class GameLoop

  def initialize(game, screen, player_manager)
    @game = game
    @screen = screen
    @player_manager = player_manager
  end

  def play
    begin
      screen.clear
      screen.display_title
      screen.display_board(game.get_board)
      screen.display_key
      play_move
    end until game.game_over?
  end 

  private 

  attr_accessor :game, :screen, :player_manager

  def play_move
    current_player = player_manager.current_player
    game_state = game.get_game_state
    move = current_player.get_move(game_state)
    player_manager.switch_turns if game.valid_move?(move)
    game.play_move(move)
  end
end
