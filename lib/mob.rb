class Mob
  attr_reader :name,
              :max_health,
              :health,
              :strength,
              :magic,
              :weapon,
              :armor
  
  def initialize(args={})
    @name       = args.fetch(:name, "Generic Mob")
    @max_health = args.fetch(:health, 10)
    @health     = args.fetch(:health, 10)
    @strength   = args.fetch(:strength, 1)
    @magic      = args.fetch(:magic, 1)

    @weapon = args.fetch(:weapon, Weapon.new)
    @armor  = args.fetch(:armor, Armor.new)
  end

  def to_s
    name
  end

  def render
    out = "HP: #{health}"
    out << ", Enraged" if enraged?
    out << ", Dead" if health == 0
    out
  end

  def health=(health)
    @health = if health < 0
      0
    elsif health > max_health
      max_health
    else
      health
    end
  end

  def enraged?
    false
  end

  def dead?
    health == 0
  end

  def attack_damage
    (weapon_attack * attack_modifier).to_i
  end

  def attack_defense
    armor.defense
  end

  private

  def weapon_attack
    weapon.damage * strength + weapon.magic * magic
  end

  def attack_modifier
    1.0
  end
end
