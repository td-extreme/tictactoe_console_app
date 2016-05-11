class GameLoop

  KEY = [1,2,3,4,5,6,7,8,9]
  def initialize(game, screen)
    @game = game
    @screen = screen
  end

  def play
    begin
      @screen.clear
      @screen.display_title
      @screen.display_board(@game.get_board)
      @screen.display_message("\n    KEY\n")
      @screen.display_board(KEY)
      play_move
    end until @game.game_over?
  end 

  private 

  def play_move
    if @game.is_current_player_ai?
      @game.play_move(@game.get_ai_player_move)
    else
      @screen.display_message("Please enter a move to play: ")
      move = get_move
      @game.play_move(move)
    end
  end

  def get_move
    available_moves = @game.available_moves
    available_moves.each_with_index do |val, i|
      available_moves[i] = val + 1
    end
    @screen.get_input(available_moves) - 1
  end
end
