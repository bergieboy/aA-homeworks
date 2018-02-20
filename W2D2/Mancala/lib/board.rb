require "byebug"
class Board
  attr_accessor :cups, :player1, :player2

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    place_stones
    @player1 = name1
    @player2 = name2
  end

  def place_stones
    (0..5).each do |idx|
      4.times { cups[idx] << :stone }
      4.times { cups[idx + 7] << :stone }
    end
    cups
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if cups[start_pos].nil? || cups[start_pos][0].nil?
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []

    idx = start_pos
    until stones.empty?
      idx += 1
      idx = 0 if idx > 13
      if idx == 6
        cups[6] << stones.pop if current_player_name == player1
      elsif idx == 13
        cups[13] << stones.pop if current_player_name == player2
      else
        cups[idx] << stones.pop
      end
    end
    next_turn(idx)
    render
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    # print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    # puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    # print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    # puts ""
    # puts ""
  end

  def one_side_empty?
    side1 = (0..5).all? { |idx| cups[idx].empty? }
    side2 = (7..13).all? { |idx| cups[idx].empty? }
    return true if side1 || side2
    false
  end

  def winner
    player1_count = cups[6].count
    player2_count = cups[13].count
    return :draw if player1_count == player2_count
    player1_count > player2_count ? player1 : player2
  end
end
