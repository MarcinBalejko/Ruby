class OrangeTree
  def initialize
    @tall = 0
    @age = 0
    @fruit = 0

    puts "A new orange tree is planted"
  end

  def height
    puts "The tree is currently " + @tall.to_s + "meters tall."
end

def count_the_oranges
  puts "There are currently " + @fruit.to_s + " oranges on the tree"
end

def pick_the_oranges
  if @fruit < 1
    puts 'Sorry, there are no oranges to pick this year.'
  else
    puts "You've picked one orange from the tree"
    @fruit = @fruit -1

  end
end



  def one_year_passes
    puts "One year passes"
    @age = @age + 1
    @tall = @tall +1
    @fruit = 0
    if dead
      puts "The orange tree dies"
      puts "Would you like to plant another orange tree?"
      answer = gets.chomp
    if answer = "yes"
        tree = OrangeTree.new
    elsif answer = "no"
        exit
    else puts "Please answer yes or no"
        answer = gets.chomp
    end
    end
    if @age > 2
      @fruit = @age * 10
    else
      @fruit = 0
    end
  end

  def dead
    @age > 5
  end

end



tree = OrangeTree.new
command = ""

while command != 'exit'
puts 'What would you like to do with your orange tree?:'
command = gets.chomp
if command == 'count the oranges'
tree.count_the_oranges
elsif command == 'wait one year'
tree.one_year_passes
elsif command == 'pick the oranges'
tree.pick_the_oranges
elsif command == 'exit'
exit
else
puts 'Can\'t understand what You want to do, please re-enter.'
end
end
