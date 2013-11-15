require 'test/unit'
require_relative '../lib/mob'
require_relative '../lib/weapon'

class MobTest < Test::Unit::TestCase

  def test_max_heath
    mob = Mob.new(health: 50)
    assert_equal(50, mob.max_health)
  end

  def test_health
    mob = Mob.new(health: 50)
    assert_equal(50, mob.health)
  end

  def test_strength
    mob = Mob.new(strength: 50)
    assert_equal(50, mob.strength)
  end

  def test_magic
    mob = Mob.new(magic: 50)
    assert_equal(50, mob.magic)
  end

  def test_weapon
    dagger = Weapon.new(type: :dagger, damage: 2)
    mob    = Mob.new(weapon: dagger)
    assert_equal(dagger, mob.weapon)
  end

  def test_render
    mob = Mob.new(health: 10)
    assert_equal('HP: 10', mob.render)
  end

  def test_set_health
    mob        = Mob.new(health: 10)
    mob.health = 5
    assert_equal(5, mob.health)
  end

  def test_set_health_less_than_zero
    mob        = Mob.new(health: 10)
    mob.health = -1
    assert_equal(0, mob.health)
  end

  def test_set_health_more_than_max_health
    mob        = Mob.new(health: 10)
    mob.health = 11
    assert_equal(10, mob.health)
  end

  def test_attack
    #pending
  end

  def test_attacked
    #pending
  end

  def test_after_attacked
    mob = Mob.new()
    assert_nil(mob.after_attacked)
  end

  def test_enraged_default
    mob = Mob.new()
    assert_equal(false, mob.enraged?)
  end
end
