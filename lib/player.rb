#

class Player < Mob

  def after_attacked
    if self.health / self.max_health < 0.25
      #puts "Player enraged!"
      @enraged = true
    end
  end
end
