require 'set'

sum = File.readlines('input')
  .map(&:strip).map(&:chars)
  .sum do |digits|
    digits = digits.map(&:to_i)
    len = digits.size
    start_idx = 0
    value = []
    (12..1).step(-1).each { |sub_len|
      start_idx = (start_idx..len-sub_len).max_by { digits[_1] }
      value << digits[start_idx]
      start_idx += 1
    }
    value.join.to_i
  end

pp "Sum? #{sum}"
