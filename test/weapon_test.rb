require 'test/unit'
require_relative '../lib/weapon'

class WeaponTest < Test::Unit::TestCase

  def test_type
    weapon = Weapon.new(type: :hammer)
    assert_equal(:hammer, weapon.type)
  end

  def test_damage
    weapon = Weapon.new(damage: 3)
    assert_equal(3, weapon.damage)
  end

  def test_magic
    weapon = Weapon.new(magic: 5)
    assert_equal(5, weapon.magic)
  end
end
