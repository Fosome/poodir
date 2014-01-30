#
# Game State: Fight
#

class Fight
  attr_reader :player, :baddie, :screen

  def initialize(opts)
    @screen = opts.fetch :screen
    @player = opts.fetch :player
    @baddie = opts.fetch :baddie
  end

  def input(val)
    case val
    when '1'
      player.skills[0].execute(baddie, screen)
    when '2'
      player.skills[1].execute(baddie, screen)
    when '3'
      baddie.skills[0].execute(player, screen)
    else
      screen.render 'Invalid input'
    end
  end

  def render
    screen.render player_status
    screen.render menu
  end

  def clear
    screen.clear
  end

  def finish
    screen.render "Exiting"
  end

  private

  def player_status
    <<-END
**********   Status   ****************
* 
*  Player  - #{player.render}
*
*  Baddie  - #{baddie.render}
*
--------------------------------------

    END
  end

  def menu
    <<-END
===========   Actions   ==============
|
|  - Player -
#{player_menu}
|
|  - Baddie -
#{baddie_menu}
|
|  q or quit. Exit game
|
--------------------------------------

    END
  end

  def player_menu
    player.skills.map.with_index(1) { |skill, index|
      "|  #{index}. #{skill}"
    }.join("\n")
  end

  def baddie_menu
    baddie.skills.map.with_index(player.skills.count + 1) { |skill, index|
      "|  #{index}. #{skill}"
    }.join("\n")
  end
end
