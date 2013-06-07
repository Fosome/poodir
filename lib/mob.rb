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

  def render
    "HP: #{health}"
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
    damage
  end

  def after_attacked
    nil  # no op
  end

  def enraged?
    @enraged
  end
end
