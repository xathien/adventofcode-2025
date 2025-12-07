require 'set'

operands = []
sum = File.readlines('input')
  .map(&:chars)
  .each(&:pop)
  .each(&:reverse!)
  .transpose
  .sum { |column|
    op = column.pop
    operand = column.join.to_i
    next 0 if operand == 0
    operands << operand
    next 0 if op == " "
    puts operands.inspect
    puts operands.reduce(&op.to_sym)
    operands.reduce(&op.to_sym).tap { operands.clear }
  }

pp "Sum? #{sum}"
