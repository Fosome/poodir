#
# Game State: Fight
#

class Fight
  attr_reader :player, :baddie, :screen

  def initialize(opts)
    @screen = opts.fetch :screen
    @player = opts.fetch :player
    @baddie = opts.fetch :baddie

    @output = []
  end

  def input(val)
    case val
    when '1'
      Attack.new(player, baddie, screen).execute
    when '2'
      Attack.new(baddie, player, screen).execute
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
*  Baddie  - #{baddie.render}
*
--------------------------------------

    END
  end

  def menu
    <<-END
===========   Actions   ==============
|
|   1. Player attacks baddie
|   2. Baddie attacks player
|
|
|   q or quit. Exit game
|
--------------------------------------

    END
  end
end
