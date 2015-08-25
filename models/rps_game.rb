class RPSGame
  @@choices = [:rock, :paper, :scissors]

  def initialize(play)
    @play = play
    unless @@choices.include?(@play)
      raise PlayTypeError
    end
  end

  class PlayTypeError < StandardError
  end

  def self.valid_play?(play)
    @@choices.include?(play)
  end

  def computer_play
    @@choices.sample
  end

  def won?
    case @play == :rock
    when computer_play == :scissors
      true
    when computer_play == :rock
      false
    when computer_play == :paper
      false
    end

    case @play == :scissors
    when computer_play == :scissors
      false
    when computer_play == :rock
      false
    when computer_play == :paper
      true
    end

    case @play == :paper
    when computer_play == :scissors
      false
    when computer_play == :rock
      true
    when computer_play == :paper
      false
    end
  end

  def tied?
    if @play == computer_play
      true
    elsif won? == true
      false
    else
      false
    end
  end

  def lost?
    !(won? || tied?)
  end
end
