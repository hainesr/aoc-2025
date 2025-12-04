# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../../aoc2025'

module AOC2025
  class PrintingDepartment < Day
    NEIGHBOURS = [[-1, -1], [0, -1], [1, -1],
                  [-1, 0],           [1, 0],
                  [-1, 1], [0, 1], [1, 1]].freeze

    def setup(input = read_input_file.chomp)
      @rolls = Hash.new(false)

      input.lines.each_with_index do |line, y|
        line.chomp.chars.each_with_index do |char, x|
          @rolls[[x, y]] = true if char == '@'
        end
      end
    end

    def part1
      @rolls.keys.count do |(x, y)|
        accessible?(x, y)
      end
    end

    def part2
      sum = 0
      count = 0

      loop do
        @rolls.each_key do |(x, y)|
          count += 1 if accessible?(x, y, remove: true)
        end
        break if count.zero?

        sum += count
        count = 0
      end

      sum
    end

    def accessible?(x, y, remove: false)
      count = 0

      NEIGHBOURS.each do |(dx, dy)|
        count += 1 if @rolls[[x + dx, y + dy]]

        return false if count > 3
      end

      @rolls.delete([x, y]) if remove
      true
    end
  end
end
