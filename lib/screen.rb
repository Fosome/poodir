class Screen

  def render(output)
    puts output
  end

  def clear
    puts "\e[H\e[2J"
  end
end
