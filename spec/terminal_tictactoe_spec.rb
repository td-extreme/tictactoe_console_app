require 'terminal_tictactoe'

describe TerminalTicTacToe do
  let(:screen) { double }
  let(:game) { double }

  describe "end of game"  do
    it "calls display_tied when game is tied" do
      subject.instance_variable_set("@screen", screen)
      subject.instance_variable_set("@game", game)
      allow(screen).to receive(:clear)
      allow(screen).to receive(:display_title)
      allow(screen).to receive(:display_board)
      allow(game).to receive(:get_board)
      expect(screen).to receive(:display_tied)
      expect(game).to receive(:tied_game?).and_return(true)
      subject.end_of_game
    end

    it "calls display_winner when game is tied" do
      subject.instance_variable_set("@screen", screen)
      subject.instance_variable_set("@game", game)
      allow(screen).to receive(:clear)
      allow(screen).to receive(:display_title)
      allow(screen).to receive(:display_board)
      allow(game).to receive(:get_board)
      allow(game).to receive(:winner)
      expect(screen).to receive(:display_winner)
      expect(game).to receive(:tied_game?).and_return(false)
      subject.end_of_game
    end
  end
end
