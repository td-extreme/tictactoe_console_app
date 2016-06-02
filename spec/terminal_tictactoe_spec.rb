require 'terminal_tictactoe'

describe TerminalTicTacToe do
  let(:screen) { double }
  let(:game) { double }
  let(:game_loop) { double }
  let(:ttt_test) { TerminalTicTacToe.new(game, game_loop, screen) }

  before(:each) do
    allow(screen).to receive(:clear)
    allow(screen).to receive(:display_title)
    allow(screen).to receive(:display_board)
    allow(game).to receive(:get_board)
    allow(game).to receive(:winner)
  end

  describe "end of game"  do
    it "calls display_tied when game is tied" do
      expect(screen).to receive(:display_tied)
      expect(game).to receive(:tied_game?).and_return(true)
      ttt_test.end_of_game
    end

    it "calls display_winner when game is tied" do
      expect(screen).to receive(:display_winner)
      expect(game).to receive(:tied_game?).and_return(false)
      ttt_test.end_of_game
    end
  end
end
