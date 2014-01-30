class Weapon
  attr_reader :type, :damage, :magic

  def initialize(args={})
    @type   = args.fetch(:type, :null_weapon)
    @damage = args.fetch(:damage, 0)
    @magic  = args.fetch(:magic, 0)
  end
end
