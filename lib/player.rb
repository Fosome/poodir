class Player < Mob

  def after_attacked
    @enraged = true if self.health.to_f / self.max_health < 0.25
  end
end
