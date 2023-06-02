class Board
  def initialize
    @cells = build_board
  end

  def display_board
    arr = []
    @cells.each_slice(3) { |tri| arr << tri }
    arr.each { |line| puts line.join(' ') }
  end

  def valid_board
    @cells.uniq.count > 2
  end

  private

  def build_board
    (1..9).to_a
  end
end
