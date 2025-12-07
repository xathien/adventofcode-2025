require 'set'

def ranges_overlap?(a, b)
  a.include?(b.begin) || b.include?(a.begin)
end

def merge_ranges(a, b)
  [a.begin, b.begin].min..[a.end, b.end].max
end

ranges = File.readlines('input')
  .map(&:strip)
  .map { |line|
    r_start, r_end = line.split("-").map(&:to_i)
    r_start..r_end
  }.sort_by(&:begin)

combined = Set.new
ranges.each_with_index { |r1, i|
  next if combined.include?(i)
  ranges.each_with_index.drop(i+1)
  .each { |r2, j|
    break unless ranges_overlap?(r1, r2)
    combined << j
    r1 = ranges[i] = merge_ranges(r1, r2)
  }
}

count = ranges.each_with_index.sum { |r, i|
  next 0 if combined.include?(i)
  r.size
}

pp "Count? #{count}"
