require 'set'

EMPTY_LINE = "."*141

def traverse(splitters, col, row, max_row)
  return 1 if row > max_row
  key = [row, col]
  if splitters.key?(key)
    splitters[key] ||= traverse(splitters, col - 1, row + 1, max_row) + traverse(splitters, col + 1, row + 1, max_row)
  else
    splitters[key] = traverse(splitters, col, row + 1, max_row)
  end
end

max_row = 0
splitters = File.readlines('input')
  .drop(2)
  .map(&:strip)
  .filter_map.with_index { |line, row|
    next if line == EMPTY_LINE
    max_row = row
    line.chars.filter_map.with_index { |char, col|
      next [[row, col], nil] if char == "^"
    }
  }.flatten(1).to_h

count = traverse(splitters, 70, 0, max_row)
# count = traverse(splitters, 7, 0, max_row)

puts splitters.inspect

pp "Count? #{count}"
