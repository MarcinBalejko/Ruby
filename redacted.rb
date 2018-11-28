puts "Enter your text here: "
text = gets.chomp
puts "Enter the word to redact: "
redact = gets.chomp
words = text.split(" ")
words.each do |word|
  if word != redact
    print word + (" ")
  else
    print "REDACTED "
  end
end

gets
