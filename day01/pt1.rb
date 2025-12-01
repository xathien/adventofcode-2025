require 'set'

v = 50
count = File.readlines('input')
    .map(&:strip)
    .count do |line|
      dir = line[0]
      diff = line[1..].to_i
      diff *= -1 if dir == "L"
      v = (v + diff) % 100
      v == 0
    end
pp "Count ? #{count}"
