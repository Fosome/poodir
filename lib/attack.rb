#

class Attack
  attr_reader :attacker, :attacked

  def initialize(attacker, attacked)
    @attacker = attacker
    @attacked = attacked
  end

  def results
    [attack, after_attack].compact
  end

  private

  def attack
    attacked.health = attacked.health - damage
    "Player attacks baddie for #{damage}"
  end

  def after_attack
    attacked.after_attacked
    if attacked.enraged?
      "Player enraged!"
    else
      nil
    end
  end

  def weapon
    attacker.weapon
  end

  def damage
    (weapon_attack * attack_modifier).to_i
  end

  def weapon_attack
    weapon.damage * attacker.strength + weapon.magic * attacker.magic
  end

  def attack_modifier
    attacker.enraged? ? 1.25 : 1.0
  end
end
