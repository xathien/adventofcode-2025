require 'set'

sum = File.readlines('input')
  .map(&:strip).map(&:chars)
  .sum do |digits|
    digits = digits.map(&:to_i)
    tens, ones = digits.combination(2).max_by { |tens, ones|
      tens * 10 + ones
    }
    tens * 10 + ones
  end

pp "Sum? #{sum}"
