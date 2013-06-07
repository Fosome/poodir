#
# A player can attack with a sword
#
# Attack is based on players strength and swords power
#

class Player
  attr_reader :strength
  
  def initialize(strength)
    @strength = strength
    @weapon = Sword.new(10)
  end

  def attack
    @weapon.power * strength
  end
end

class Sword
  attr_reader :power

  def initialize(power)
    @power = power
  end
end

player = Player.new(5)

puts player.attack
