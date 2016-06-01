require 'game_loop'

describe GameLoop do
  let (:game) { double }
  let (:screen) { double }
  let (:player_manager) { double }
  let (:test_loop) { GameLoop.new(game, screen, player_manager) }

  describe "The game loop" do
    it "the loop exits if the game is over" do
      allow(screen).to receive(:clear)
      allow(screen).to receive(:display_title)
      allow(screen).to receive(:display_board)
      allow(screen).to receive(:display_message)
      allow(screen).to receive(:display_key)
      allow(game).to receive(:get_board)
      allow(test_loop).to receive(:play_move)
      expect(game).to receive(:game_over?).and_return(true)
      test_loop.play
    end

    it "the loop doesn't exit when the game is still going" do
      allow(screen).to receive(:clear)
      allow(screen).to receive(:display_title)
      allow(screen).to receive(:display_board)
      allow(screen).to receive(:display_message)
      allow(screen).to receive(:display_key)
      allow(game).to receive(:get_board)
      expect(test_loop).to receive(:play_move).twice
      expect(game).to receive(:game_over?).and_return(false, true)
      test_loop.play
    end
  end
end
