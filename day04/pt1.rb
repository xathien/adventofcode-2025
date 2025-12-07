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

count = grid.each_with_index.sum { |row, ri|
  row.each_with_index.count { |char, ci|
    next false unless char == "@"
    adj = dirs.count { |dr, dc|
      ar = ri + dr
      ac = ci + dc
      (ar >= 0) && (ar < ri_max) && (ac >= 0) && (ac < ci_max) && grid[ar][ac] == "@"
    }
    adj < 4
  }
}
pp "Count? #{count}"
