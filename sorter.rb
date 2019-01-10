
books = ["Harry Potter", "Misery", "King Rat", "Quo Vadis", "Snowman", "Shining"]


class Sorter

def ascending(array)
  array.sort{|firstbook, secondbook| firstbook <=> secondbook}
end

def descending(array)
  array.sort{|firstbook, secondbook| secondbook <=> firstbook}
end
end

a_sorter = Sorter.new
puts a_sorter.descending(books)
