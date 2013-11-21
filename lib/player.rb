class Player < Mob

  def enraged?
    health.to_f / max_health < 0.25
  end

  private

  def attack_modifier
    enraged? ? 1.25 : 1.0
  end
end
