#

class Weapon
  attr_reader :type, :damage, :magic

  def initialize(args)
    @type   = args.fetch(:type, :sword)
    @damage = args.fetch(:damage, 1)
    @magic  = args.fetch(:magic, 0)
  end
end

class NullWeapon < Weapon
  
  def initialize
    super(type: :null_weapon, damage: 0, magic: 0)
  end
end
