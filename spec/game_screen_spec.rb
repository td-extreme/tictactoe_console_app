require 'game_screen'

describe GameScreen do

  let (:wrapper) { double }
  let (:test_screen) { GameScreen.new(wrapper) }
  describe "printing the gameboad" do
    it "sends message :print to wrapper_stdio" do
      board = "dummy"
      expect(wrapper).to receive(:print_message)
      test_screen.display_board(board)
    end
  end

  describe "printings end of game messages" do
    it "display_winner sends :puts message to wrapper_stdio" do
      expect(wrapper).to receive(:puts_message)
      test_screen.display_winner('O')
    end
    it "display_tied sends :puts message to wrapper_stdio" do
      expect(wrapper).to receive(:puts_message)
      test_screen.display_tied
    end
  end

  describe "printing the title info" do
    it "display_title sends :puts message to wrapper_stdio" do
      expect(wrapper).to receive(:puts_message)
      test_screen.display_title
    end
  end

  describe "geting intput" do
    it "returns the correct input" do
      expect(wrapper).to receive(:get_input).and_return("3")
      expect(test_screen.get_input([1, 3])).to eq(3)
    end

    it "doesn't return an input out of range" do
      expect(wrapper).to receive(:get_input).and_return("5", "1")
      expect(test_screen.get_input([1, 2])).to eq(1)
    end
  end
end
