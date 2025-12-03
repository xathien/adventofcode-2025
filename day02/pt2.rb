require 'set'

sum = File.read("input").strip.split(",")
  .sum do |group|
    l, r = group.split("-").map(&:to_i)
    (l..r).sum { |num|
      digits = num.digits
      digit_count = digits.size
      half_size = digit_count / 2
      repeated = (1..half_size).any? { |size| digits.each_slice(size).uniq.size == 1 }
      next 0 unless repeated
      num
    }
  end

pp "Sum? #{sum}"

