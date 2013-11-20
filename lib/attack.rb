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
    damage = attacker.attack_damage

    attacked.health = attacked.health - damage

    screen.render "#{attacker} attacks #{attacked} for #{damage} damage"
  end

  def after_attack
    attacked.after_attacked

    screen.render "#{attacked} enraged!" if attacked.enraged?
  end
end
