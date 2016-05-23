require 'game_setup'

describe GameSetup do
  let (:screen) { double }
  let (:setup) { GameSetup.new(screen) }

  describe "setting up the game" do
    it "setup method returns HUMAN HUMAN when input is 1 and 1" do
      allow(screen).to receive(:display_message)
      allow(screen).to receive(:clear)
      expect(screen).to receive(:get_input).and_return(1, 1)
      player1, player2 = setup.setup
      expect(player1).to eq("human")
      expect(player2).to eq("human")
    end

    it "setup method returns HUMAN EASY when input is 1 and 2" do
      allow(screen).to receive(:display_message)
      allow(screen).to receive(:clear)
      expect(screen).to receive(:get_input).and_return(1, 2)
      player1, player2 = setup.setup
      expect(player1).to eq("human")
      expect(player2).to eq("easy")
    end 

    it "setup method returns HUMAN HARD when input is 1 and 3" do
      allow(screen).to receive(:display_message)
      allow(screen).to receive(:clear)
      expect(screen).to receive(:get_input).and_return(1, 3)
      player1, player2 = setup.setup
      expect(player1).to eq("human")
      expect(player2).to eq("hard")
    end

    it "setup method returns HARD HUMAN when input is 2 and 3" do
      allow(screen).to receive(:display_message)
      allow(screen).to receive(:clear)
      expect(screen).to receive(:get_input).and_return(2, 3)
      player1, player2 = setup.setup
      expect(player1).to eq("hard")
      expect(player2).to eq("human")
    end
  end
end
