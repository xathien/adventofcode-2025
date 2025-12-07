require 'set'

beam_indices = Set.new
beam_indices << 70
count = 0
File.readlines('input')
  .drop(1)
  .map(&:strip)
  .each do |line|
    next_indices = Set.new
    beam_indices.each { |index|
      if line[index] == "^"
        count += 1
        next_indices.merge([index - 1, index + 1])
      else
        next_indices << index
      end
    }
    beam_indices = next_indices
  end

pp "Count? #{count}"
