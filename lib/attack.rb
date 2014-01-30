class Attack
  attr_reader :owner

  def initialize(mob)
    @owner = mob
  end

  def execute(target, screen)
    offense = owner.attack_damage
    screen.render "#{owner} stikes for #{offense}"

    defense = target.attack_defense
    screen.render "#{target} defends for #{defense}"

    damage = offense > defense ? offense - defense : 0

    target.health = target.health - damage
    screen.render "#{owner} attacks #{target} for #{damage} damage"
  end

  def to_s
    'Attack'
  end

  def description
    'A melee attack with equiped weapon'
  end
end
