#
# A player can attack a baddie with a magic sword, and
# the baddie attacks back with a club
# A player can trigger special passive abilities
#
# Attack is based on players strength and swords damage
# Attack is based on players magic and swords magic
# Attack is based on baddies strength and clubs damage
# Baddie and player will lose life when attacked
# A player whos health is under 25% will enrage
# A player who is enraged does 25% more damage per attack
#

class Mob
  attr_reader :max_health, :health, :strength, :magic, :weapon
  
  def initialize(args)
    @max_health = args.fetch(:health, 10)
    @health     = args.fetch(:health, 10)
    @strength   = args.fetch(:strength, 1)
    @magic      = args.fetch(:magic, 1)
    @weapon     = args.fetch(:weapon, NullWeapon.new)

    @enraged    = false
  end

  def health=(health)
    @health = health > 0 ? health : 0
  end

  def attack(baddie)
    baddie.attacked(Attack.new(self, weapon).damage)
  end

  def attacked(damage)
    self.health = self.health - damage
    after_attacked
  end

  def after_attacked
    nil  # no op
  end

  def enraged?
    @enraged
  end
end

class Player < Mob

  def after_attacked
    if self.health / self.max_health < 0.25
      puts "Player enraged!"
      @enraged = true
    end
  end
end

class Weapon
  attr_reader :type, :damage, :magic

  def initialize(args)
    @type   = args.fetch(:type, :sword)
    @damage = args.fetch(:damage, 1)
    @magic  = args.fetch(:magic, 0)
  end
end

class NullWeapon < Weapon
  
  def initialize
    super(type: :null_weapon, damage: 0, magic: 0)
  end
end

class Attack
  attr_reader :wielder, :weapon

  def initialize(wielder, weapon)
    @wielder = wielder
    @weapon  = weapon
  end

  def damage
    damage = weapon_attack * attack_modifier
    puts "Attacks for #{damage}"
    damage
  end

  private

  def weapon_attack
    weapon.damage * wielder.strength + weapon.magic * wielder.magic
  end

  def attack_modifier
    wielder.enraged? ? 1.25 : 1.0
  end
end

sword  = Weapon.new(type: :sword, damage: 1, magic: 5)
club   = Weapon.new(type: :club, damage: 2, magic: 0)

player = Player.new(health: 10, strength: 1, magic: 5, weapon: sword)
baddie = Mob.new(health: 100, strength: 4, weapon: club)

puts "Baddies health: #{baddie.health}"
puts "Player attacks baddie"
player.attack(baddie)
puts "Baddies health: #{baddie.health}"

puts "Players health: #{player.health}"
puts "Baddie attacks player"
baddie.attack(player)
puts "Players health: #{player.health}"

puts "Baddies health: #{baddie.health}"
puts "Player attacks baddie"
player.attack(baddie)
puts "Baddies health: #{baddie.health}"
