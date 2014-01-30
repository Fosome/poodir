class Fireball
  attr_reader :owner

  def initialize(mob)
    @owner = mob
  end

  def execute(target, screen)
    damage = base_magic + magic_damage

    target.health = target.health - damage
    screen.render "#{owner} casts Fireball at #{target} for #{damage} damage"
  end

  def to_s
    'Fireball'
  end

  def description
    'Casts a fireball'
  end

  private

  def base_magic
    3
  end

  def magic_damage
    @owner.magic
  end
end
