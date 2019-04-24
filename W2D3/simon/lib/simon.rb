class Simon
  COLORS = %w(red blue green yellow)
  #["red", "blue", "green", "yellow"]

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over == true
      self.take_turn
    end

    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if @game_over == false
      self.round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    p self.seq
    sleep(1)
    system("clear")
  end

  def require_sequence
    puts "Have at it. What was the first color in the sequence?"
    i = 0
    guess = gets.chomp
    while guess == seq[i]
      self.show_sequence
      puts "Okay. Next color?"
      guess = gets.chomp
      i += 1
    end
    self.game_over = true
  end

  def add_random_color
    self.seq << COLORS[rand(0..3)]
  end

  def round_success_message
    "Nice! You got it."
  end

  def game_over_message
    p "Ha. You blew it. The game is over."
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

game = Simon.new()
game.play