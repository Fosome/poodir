#
# A player can attack a baddie with a magic sword
#
# Attack is based on players strength and swords damage
# Attack is based on players magic and swords magic
# Baddie will lose life when attacked
#

class Player
  attr_reader :strength, :magic
  
  def initialize(args)
    @strength = args.fetch(:strength, 1)
    @magic    = args.fetch(:magic, 1)
    @weapon   = args.fetch(:weapon, NullWeapon.new)
  end

  def attack(baddie)
    baddie.attacked(@weapon.damage * self.strength + @weapon.magic * self.magic)
  end
end

class Sword
  attr_reader :damage, :magic

  def initialize(args)
    @damage = args.fetch(:damage, 1)
    @magic  = args.fetch(:magic, 0)
  end
end

class NullWeapon
  
  def damage
    0
  end

  def magic
    0
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

sword  = Sword.new(damage: 1, magic: 5)
player = Player.new(strength: 1, magic: 5, weapon: sword)
baddie = Baddie.new(50)

puts baddie.health

player.attack(baddie)

puts baddie.health
