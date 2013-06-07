#
# Set up ur game here!
#

require './game_shell'

sword  = Weapon.new(type: :sword, damage: 1, magic: 5)
club   = Weapon.new(type: :club, damage: 2, magic: 0)

player = Player.new(health: 10, strength: 1, magic: 5, weapon: sword)
baddie = Mob.new(health: 100, strength: 4, weapon: club)


screen = Screen.new
state  = Fight.new(player: player, baddie: baddie, screen: screen)

GameShell.new(state).run
