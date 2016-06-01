class HumanPlayer

  def initialize(screen)
    @screen = screen
  end

  def get_move(game_state)
    available_moves = game_state.game_board.available_moves
    available_moves.each_with_index do |val, i|
      available_moves[i] = val + 1
    end
    screen.get_input(available_moves) - 1
  end

  private
  attr_accessor :game, :screen
end
