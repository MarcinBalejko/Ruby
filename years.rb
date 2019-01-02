
puts "start year"
year01 = gets.chomp.to_i
puts "end year"
year02 = gets.chomp.to_i

for num in (year01...year02)
if num % 4 == 0
puts num
elsif num % 100 == 0
elsif num % 400 == 0
puts num
end
end

gets
