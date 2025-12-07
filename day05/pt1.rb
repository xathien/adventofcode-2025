require 'set'

ranges = File.readlines('input')
  .map(&:strip)
  .map { |line|
    r_start, r_end = line.split("-").map(&:to_i)
    r_start..r_end
  }

count = File.readlines('input2')
  .map(&:strip)
  .count do |line|
    id = line.to_i
    ranges.any? { _1.include?(id) }
  end

pp "Count? #{count}"
