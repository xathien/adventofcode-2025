require 'set'

sum = File.readlines('input')
  .map(&:strip)
  .map { _1.split(/\s+/)}
  .transpose
  .sum { |problem|
    puts "problem #{problem}"
    op = problem.pop.to_sym
    problem.map(&:to_i).reduce(&op)
  }

pp "Sum? #{sum}"
