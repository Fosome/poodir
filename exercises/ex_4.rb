#
# A player can attack a baddie with a magic sword, and
# the baddie attacks back with a club
#
# Attack is based on players strength and swords damage
# Attack is based on players magic and swords magic
# Attack is based on baddies strength and clubs damage
# Baddie and player will lose life when attacked
#

class Mob
  attr_reader :health, :strength, :magic
  
  def initialize(args)
    @health   = args.fetch(:health, 10)
    @strength = args.fetch(:strength, 1)
    @magic    = args.fetch(:magic, 1)
    @weapon   = args.fetch(:weapon, NullWeapon.new)
  end

  def health=(health)
    @health = health > 0 ? health : 0
  end

  def attack(baddie)
    baddie.attacked(@weapon.strike(self))
  end

  def attacked(damage)
    self.health = self.health - damage
  end
end

class Weapon
  attr_reader :type, :damage, :magic

  def initialize(args)
    @type   = args.fetch(:type, :sword)
    @damage = args.fetch(:damage, 1)
    @magic  = args.fetch(:magic, 0)
  end

  def strike(wielder)
    self.damage * wielder.strength + self.magic * wielder.magic
  end
end

class NullWeapon < Weapon
  
  def initialize
    super(type: :null_weapon, damage: 0, magic: 0)
  end
end


sword  = Weapon.new(type: :sword, damage: 1, magic: 5)
club   = Weapon.new(type: :club, damage: 2, magic: 0)

player = Mob.new(health: 100, strength: 1, magic: 5, weapon: sword)
baddie = Mob.new(health: 50, strength: 3, weapon: club)

puts "Baddies health: #{baddie.health}"
puts "Player attacks baddie"
player.attack(baddie)
puts "Baddies health: #{baddie.health}"

puts "Players health: #{player.health}"
puts "Baddie attacks player"
baddie.attack(player)
puts "Players health: #{player.health}"
