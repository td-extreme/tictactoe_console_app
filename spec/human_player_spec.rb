require 'human_player'
describe HumanPlayer do

  let (:screen) { double }
  let (:board) { double }
  let (:test_player) { HumanPlayer.new(screen) }
  let (:game_state) { double }

  before(:each) do
    allow(game_state).to receive(:game_board).and_return(board)
    allow(board).to receive(:available_moves).and_return([1, 2, 3, 4, 5])
  end

  it "play_move returns 0 when the user input is 1 and it is a valid move" do
    allow(screen).to receive(:get_input).and_return(1)
    expect(test_player.get_move(game_state)).to eq(0)
  end


  it "play_move returns 1 when that the user input is 2 and it is a valid move" do
    allow(screen).to receive(:get_input).and_return(2)
    expect(test_player.get_move(game_state)).to eq(1)
  end
end
