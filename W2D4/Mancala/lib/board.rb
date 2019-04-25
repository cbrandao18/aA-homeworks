class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14)
    place_stones()
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..5).each do |i|
      @cups[i] = [:stone, :stone, :stone, :stone]
    end
    (7..12).each do |i|
      @cups[i] = [:stone, :stone, :stone, :stone]
    end

    @cups[6] = [] #side 1's store cup
    @cups[13] = [] #side 2's store cup
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0, 13)
      raise "Invalid starting cup"
    end
    if @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].length
    current_pos = start_pos

    side = current_player_name == @name1 ? 1 : 2
    

    while stone = @cups[start_pos].pop()
      current_pos = (current_pos + 1) % 14
      if current_pos == 6 && side == 2
        @cups[start_pos].push(stone)
      elsif current_pos == 13 && side == 1
        @cups[start_pos].push(stone)
      else
        @cups[current_pos].push(stone)
      end
    end
    render()
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = @cups[0..5].all?{|subarr| subarr.empty?}
    side2 = @cups[7..12].all?{|subarr| subarr.empty?}
    side1 || side2
  end

  def winner
    if @cups[6].length == @cups[13].length
      return :draw
    elsif @cups[6].length > @cups[13].length
      return @name1  
    else
      return @name2
    end
  end
end
