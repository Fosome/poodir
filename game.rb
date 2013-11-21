#
# Set up ur game here!
#

require './game_shell'

sword      = Weapon.new(:type => :sword, :damage => 1, :magic => 5)
iron_armor = Armor.new(:type => :iron, :defense => 3)
player     = Player.new(:name => 'Good guy', :health => 10, :strength => 1, :magic => 5, :weapon => sword)

club          = Weapon.new(:type => :club, :damage => 2, :magic => 0)
leather_armor = Armor.new(:type => :leather, :defense => 1)
baddie        = Mob.new(:name => 'Baddie', :health => 100, :strength => 4, :weapon => club)


screen = Screen.new
state  = Fight.new(player: player, baddie: baddie, screen: screen)

GameShell.new(state).run
