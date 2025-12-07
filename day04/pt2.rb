require 'set'

grid = File.readlines('input')
  .map(&:strip)
  .map do |line|
    line.split("")
  end

ri_max = grid.size
ci_max = grid[0].size
dirs = [
  [0, 1],
  [1, 0],
  [0, -1],
  [-1, 0],
  [1, 1],
  [1, -1],
  [-1, 1],
  [-1, -1],
]

count = 0
loop do
  to_remove = grid.each_with_index.flat_map { |row, ri|
    row.each_with_index.filter_map { |char, ci|
      next unless char == "@"
      adj = dirs.count { |dr, dc|
        ar = ri + dr
        ac = ci + dc
        (ar >= 0) && (ar < ri_max) && (ac >= 0) && (ac < ci_max) && grid[ar][ac] == "@"
      }
      next unless adj < 4
      [ri, ci]
    }
  }
  break if to_remove.empty?
  count += to_remove.size
  to_remove.each { |ri, ci| grid[ri][ci] = "." }
end
pp "Count? #{count}"
