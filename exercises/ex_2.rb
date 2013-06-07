#
# A player can attack a baddie with a sword
#
# Attack is based on players strength and swords power
# Baddie will lose life when attacked
#

class Player
  attr_reader :strength
  
  def initialize(strength)
    @strength = strength
    @weapon = Sword.new(10)
  end

  def attack(baddie)
    baddie.attacked(@weapon.power * strength)
  end
end

class Baddie
  attr_reader :health

  def initialize(health = 10)
    @health = health
  end

  def health=(health)
    @health = health > 0 ? health : 0
  end

  def attacked(damage)
    self.health = self.health - damage
  end
end

class Sword
  attr_reader :power

  def initialize(power)
    @power = power
  end
end

player = Player.new(3)
baddie = Baddie.new(50)

puts baddie.health

player.attack(baddie)

puts baddie.health
