#
# Repl for user input
#

Dir[File.dirname(__FILE__) + '/lib/*'].each { |f| require f }

class GameShell
  EXIT_OPTS = %w(q quit exit)

  attr_reader :state

  def initialize(state)
    @state = state
  end

  def run
    clear_state

    begin
      render_state
      read_input
      clear_state
      execute
    end while not exit?
  end

  private

  def exit?
    @exit
  end

  def render_state
    state.render
  end

  def clear_state
    state.clear
  end

  def read_input
    print '$ '
    $stdout.flush

    @input = STDIN.gets.chomp
  end

  def execute
    if EXIT_OPTS.include?(@input)
      state.finish
      @exit = true
    else
      state.input(@input)
    end
  end
end
