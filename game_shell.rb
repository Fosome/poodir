#
# Repl for user input
#

Dir[File.dirname(__FILE__) + '/lib/*'].each { |f| require f }

class GameShell
  EXIT_OPTS = %w( q quit exit)

  def initialize(state)
    @state = state
  end

  def run
    begin
      render_state
      read_input
      execute
    end while not exit?
  end

  private

  def exit?
    @exit
  end

  def render_state
    puts @state.output
    puts @state.player_status
    puts @state.menu
    print_prompt
  end

  def print_prompt
    print '$ '
    $stdout.flush
  end

  def read_input
    @input = STDIN.gets.chomp
  end

  def execute
    if EXIT_OPTS.include?(@input)
      @exit = true
      puts 'Exiting game.'
    else
      @state.input(@input)
    end
  end
end
