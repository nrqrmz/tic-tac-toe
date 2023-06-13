require_relative '../views/view'

class Board
  def initialize
    @cells = build_board
    @view = View.new

    @view.display_board(@cells)
  end

  def valid_board
    @cells.uniq.count > 2
  end

  private

  def build_board
    (1..9).to_a
  end
end
