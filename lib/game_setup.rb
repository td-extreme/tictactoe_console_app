class GameSetup

  OPPONENT_TEXT = "\nSelect an Opponent to Play against.\n1. Human\n2. Ai Easy\n3. Ai Hard\n:"
  OPPONENT_CHOICES = [1, 2, 3]

  ORDER_TEXT = "\nWho should got first.\n1. Player\n2. Opponent\n:"
  ORDER_CHOICES = [1, 2]

  def initialize(game_screen)
    @screen = game_screen
  end

  def setup
    order = get_order
    opponent = get_opponent
    order == 1 ? ["human", opponent] : [opponent, "human"]
  end

  private

  def get_order
    @screen.clear
    @screen.display_message(ORDER_TEXT)
    @screen.get_input(ORDER_CHOICES)
  end

  def get_opponent
    @screen.clear
    @screen.display_message(OPPONENT_TEXT)
    choice = @screen.get_input(OPPONENT_CHOICES)
    case choice
    when 1
      opponent = "human"
    when 2
      opponent = "easy"
    when 3
      opponent = "hard"
    end
    opponent
  end
end
