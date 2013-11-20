#

class Attack
  attr_reader :attacker, :attacked, :screen

  def initialize(attacker, attacked, screen)
    @attacker = attacker
    @attacked = attacked
    @screen   = screen
  end

  def execute
    before_attack
    attack
    after_attack
  end

  private

  def before_attack
  end

  def attack
    attacked.health = attacked.health - damage

    screen.render "#{attacker} attacks #{attacked} for #{damage} damage"
  end

  def after_attack
    attacked.after_attacked

    screen.render "#{attacked} enraged!" if attacked.enraged?
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
