require 'set'

v = 50
count = File.readlines('input')
    .map(&:strip)
    .sum do |line|
      dir = line[0]
      diff = line[1..].to_i
      diff *= -1 if dir == "L"
      v += diff
      passed_zero, v = v.divmod(100)
      passed_zero.abs
    end
pp "Count ? #{count}"
