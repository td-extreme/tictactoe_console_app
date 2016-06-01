require 'wrapper_stdio'

class GameScreen

  def initialize(wrapper)
    @wrapper = wrapper
  end

  def clear
    @wrapper.clear_screen
  end

  def display_title
    @wrapper.puts_message(" Tic Tac Toe ")
  end

  def display_board(board)
    @wrapper.print_message(format_board(board))
  end

  def display_winner(winner)
    @wrapper.puts_message("\nPlayer #{winner} won!\n\n")
  end

  def display_tied
    @wrapper.puts_message("\nTied Game!\n\n")
  end

  def display_message(message)
    @wrapper.print_message(message)
  end

  def get_input(range)
    begin
      input = @wrapper.get_input.to_i
      input_is_valid = range.include?(input)
      display_try_again(range) if !input_is_valid
    end until input_is_valid
    input
  end

  def get_opponent
    display_message ("\nSelect an Opponent to Play against.\n1. Human\n2. Ai Easy\n3. Ai Hard\n:")
    get_input ([1, 2, 3])
  end

  def get_player_order
    display_message ("\nWho should got first.\n1. Player\n2. Opponent\n:")
    get_input ([1, 2])
  end

  private

  def display_try_again(range)
    rtn_string = "That is not a valid input. Please enter one of the following values ( "
    range.each do |val|
      rtn_string << "#{val} "
    end
    rtn_string << ") : "
    display_message(rtn_string)
  end

  def format_board(board)
    rtn_board = "\n"
    [0, 3, 6].each do | i|
    rtn_board << " #{board[i]} | #{board[i+1]} | #{board[i+2]} \n"
    rtn_board << "--- --- ---\n" if i != 6
    end
    rtn_board
  end
end
