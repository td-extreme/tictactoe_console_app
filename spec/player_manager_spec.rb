require 'player_manager'

describe PlayerManager do
  let (:screen) { double }
  let (:rules) { double }
  let (:test_manager) { PlayerManager.new(:human, :easy, rules, screen) }
  let (:test_manager2) { PlayerManager.new(:hard, :easy, rules, screen) }

  describe "Constructor" do

    it "sets player 1 to Human when 'human' is argument 1 of constructor" do
      expect(test_manager.current_player.class).to eq(HumanPlayer)
    end

    it "sets player 2 to AiBasic class when 'easy' is argument 2 of constructor" do
      test_manager.switch_turns
      expect(test_manager.current_player.class).to eq(AiBasic)
    end

    it "set player 1 to AiMinimax class when 'hard' is argument 1 of constructor" do
      expect(test_manager2.current_player.class).to eq(AiMinimax)
    end
  end

  describe "switching turns" do
    it "current_player = player2 after switch_turns is called" do
      player2 = test_manager.non_current_player
      test_manager.switch_turns
      expect(test_manager.current_player).to eq(player2)
    end
  end
end
