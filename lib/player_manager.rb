require 'ai_basic'
require 'ai_minimax'
require 'human_player'

class PlayerManager

  attr_reader :current_player


  def initialize(player_type1, player_type2, rules, screen)
    @rules = rules
    @screen = screen
    @player1 = set_player(player_type1)
    @player2 = set_player(player_type2)
    @current_player = @player1
  end

  def non_current_player
    (@current_player == @player1) ? @player2 : @player1
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  private

  attr_accessor :player1, :player2, :screen, :rules

  def set_player(type)
    case type
    when :easy
      AiBasic.new(rules)
    when :hard
      AiMinimax.new(rules)
    else
      HumanPlayer.new(screen)
    end
  end
end
