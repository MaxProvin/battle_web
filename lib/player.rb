class Player

  DEFAULT_HIT_POINTS = 60
  DEFAULT_ATTACK_VAL = -10
  attr_reader :name, :hit_points

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def attack(player)
    player.reduce
  end

  def reduce
    @hit_points -=10
  end


end
