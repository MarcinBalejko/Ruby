class Die

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    puts @numberShowing
  end

end

die = Die.new

command = ""

while command != "exit"
puts "Do you want to roll the die? (yes/no)"
command = gets.chomp
if command == "yes"
  die.roll
  die.showing
elsif command == "no"
  exit
end
end

gets
