#

class Attack
  attr_reader :wielder, :weapon

  def initialize(wielder, weapon)
    @wielder = wielder
    @weapon  = weapon
  end

  def damage
    weapon_attack * attack_modifier
  end

  private

  def weapon_attack
    weapon.damage * wielder.strength + weapon.magic * wielder.magic
  end

  def attack_modifier
    wielder.enraged? ? 1.25 : 1.0
  end
end
