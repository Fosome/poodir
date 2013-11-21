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

  def log(message)
    screen.render message
  end

  def before_attack
  end

  def attack
    offense = attacker.attack_damage
    log "#{attacker} stikes for #{offense}"

    defense = attacked.attack_defense
    log "#{attacked} defends for #{defense}"

    damage = offense > defense ? offense - defense : 0

    attacked.health = attacked.health - damage
    log "#{attacker} attacks #{attacked} for #{damage} damage"
  end

  def after_attack
  end
end
