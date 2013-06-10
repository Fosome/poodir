#
#
#

class Player < Mob

  def after_attacked
    @enraged = true if self.health / self.max_health < 0.25
  end
end
