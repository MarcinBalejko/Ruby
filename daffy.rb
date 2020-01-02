puts "Enter your thring pleathe: "
text = gets.chomp
while text.empty?
  puts "No data detected! Pleathe input data: "
  text = gets.chomp
end

while
if text.include? "s" or text.include? "S"
  text.gsub!(/s/, "th")
  text.gsub!(/S/, "Th")
  puts "Your thring: #{text}"
  puts ""
  puts "Enter your thring pleathe: "
  text = gets.chomp
else
  puts "Nothing to Daffy Duckify!"
  text= gets.chomp
end
end

gets
