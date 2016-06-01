class PlayerSetup

  def initialize(game_screen)
    @screen = game_screen
  end

  def setup
    order = get_order
    opponent = get_opponent
    order == 1 ? [:human, opponent] : [opponent, :human]
  end

  private

  attr_accessor :screen
  def get_order
    screen.clear
    screen.get_player_order
  end

  def get_opponent
    screen.clear
    choice = screen.get_opponent
    {
      1 => :human,
      2 => :easy,
      3 => :hard
    }[choice]
  end
end
