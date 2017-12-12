class RingBuffer
  def initialize(length)
    @arr = (0..length).to_a
    @pointer = 0
  end

  def increment
    @pointer += 1
    if @pointer > @arr.length - 1
      @pointer = 0
    end
  end

  def decrement
    @pointer -= 1 
    if @pointer < 0 
      @pointer = @arr.length - 1
    end
  end

  def show
    @arr 
  end

  def get_value
    @arr[@pointer]
  end

  def place_at(_index)
    @pointer = _index % @arr.length
  end
end

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    i = 0 
    while i <= 12
      if i == 6 
        i += 1
      end
      4.times do 
        @cups[i] << :stone
      end
      i += 1
    end
  end

  def valid_move?(start_pos)
    if start_pos > 14 || @cups[start_pos].empty?
      raise StandardError.new("Invalid starting cup")
    end
  end

  def make_move(start_pos, current_player_name)
    # get all stones from cup
    hand = []
    until @cups[start_pos].empty?
      hand << @cups[start_pos].pop
    end

    buffer = RingBuffer.new(13)

    # start from the next position  
    buffer.place_at(start_pos + 1)
    while hand.length > 0 
      if buffer.get_value == 13 
        buffer.increment
      else
        @cups[buffer.get_value] << hand.pop 
        buffer.increment
      end
    end
    buffer.decrement
    render    
    next_turn(buffer.get_value)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6  || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    elsif @cups[ending_cup_idx].length > 1 
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
    @cups[7..12].all? {|e| e.empty? } || @cups[0..5].all? {|e| e.empty? }
  end

  def winner
    if one_side_empty? 

    end
  end
end
