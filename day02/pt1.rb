require 'set'

sum = File.read("input").strip.split(",")
  .sum do |group|
    l, r = group.split("-").map(&:to_i)
    (l..r).sum { |num|
      digits = num.digits
      digit_count = digits.size
      next 0 if digit_count.odd?
      half_size = digit_count / 2
      repeated = (0...half_size).all? { |i| digits[i] == digits[i + half_size] }
      next 0 unless repeated
      num
    }
  end

pp "Sum? #{sum}"
