letters = {"c" => 3, "e" => 1, "l" => 1, "n" => 1, "t" => 1, "x" => 8, "y" => 4}

total_points = Hash.new(0)
'excellently'.each_char {|k| total_points[k] += letters[k]}

puts total_points
puts total_points.values.reduce(:+)
