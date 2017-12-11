class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while !@game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    while !@game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |e|
      print color 
      puts 
      sleep 1
      system 'clear'
      sleep 1
    end
  end

  def require_sequence
    puts 'give letter'
    @seq.each do |c|
      input = gets.chomp 
      if color.first != user_color 
        @game_over = true 
        break
      end 
      sleep 1
    end
  end

  def add_random_color
    @seq << COLORS.shuffle[0]
  end

  def round_success_message
    puts "You Win"
  end

  def game_over_message
    puts "Game OVER! #{@sequence_length}"
  end

  def reset_game
    new_game
  end

  private 

  def new_game 
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end
end
