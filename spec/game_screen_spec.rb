require 'game_screen'

describe GameScreen do

  let (:wrapper) { double }

  describe "printing the gameboad" do
    it "sends message :print to wrapper_stdio" do
      board = "dummy"
      subject.instance_variable_set("@wrapper", wrapper)
      expect(wrapper).to receive(:print_message)
      subject.display_board(board)
    end
  end

  describe "printings end of game messages" do
    it "display_winner sends :puts message to wrapper_stdio" do
      subject.instance_variable_set("@wrapper", wrapper)
      expect(wrapper).to receive(:puts_message)
      subject.display_winner('O')
    end
    it "display_tied sends :puts message to wrapper_stdio" do
      subject.instance_variable_set("@wrapper", wrapper)
      expect(wrapper).to receive(:puts_message)
      subject.display_tied
    end
  end

  describe "printing the title info" do
    it "display_title sends :puts message to wrapper_stdio" do
      subject.instance_variable_set("@wrapper", wrapper)
      expect(wrapper).to receive(:puts_message)
      subject.display_title
    end
  end

  describe "geting intput" do
    it "returns the correct input" do
      subject.instance_variable_set("@wrapper", wrapper)
      expect(wrapper).to receive(:get_input).and_return("3")
      expect(subject.get_input(["1", "3"])).to eq("3")
    end

    it "doesn't return an input out of range" do
      subject.instance_variable_set("@wrapper", wrapper)
      expect(wrapper).to receive(:get_input).and_return("5", "1")
      expect(subject.get_input(["1", "2"])).to eq("1")
    end
  end
end

