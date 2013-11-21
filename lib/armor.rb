class Armor
  attr_reader :type, :defense

  def initialize(args={})
    @type    = args.fetch(:type, :null_armor)
    @defense = args.fetch(:defense, 0)
  end
end
