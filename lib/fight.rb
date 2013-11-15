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
    @output = case val
    when '1'
      Attack.new(player, baddie).results
    when '2'
      Attack.new(baddie, player).results
    else
      []
    end
  end

  def render
    render_output

    screen.render player_status
    screen.render menu
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

  def render_output
    @output.map do |line|
      screen.render "!! #{line}"
    end
  end
end
