require 'wrapper_stdio'

class GameScreen

  
  def initialize
    @wrapper = WrapperStdio.new
  end

  def display_title
    @wrapper.puts_message(" Tic Tac Toe ")
  end

  def display_board(board)
    @wrapper.print_message(format_board(board))
  end

  def display_winner(winner)
    @wrapper.puts_message("Player #{winner} won!")
  end

  def display_tied
    @wrapper.puts_message("Tied Game!")
  end

  def display_message(message)
    @wrapper.puts_message
  end

  def get_input(range)
    begin
      input = @wrapper.get_input
      input.to_i
    end until range.include?(input)
    input
  end

  private

  def format_board(board)
    rtn_board = "\n"
    [0, 3, 6].each do | i|
      rtn_board << " #{board[i]} | #{board[i+1]} | #{board[i+2]} \n"
      rtn_board << "--- --- ---\n" if i != 6
    end
    rtn_board
  end

end
