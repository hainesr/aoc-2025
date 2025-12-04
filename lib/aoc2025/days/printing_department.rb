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
        adjacent_count(x, y) < 4
      end
    end

    def adjacent_count(x, y)
      count = 0

      NEIGHBOURS.each do |(dx, dy)|
        count += 1 if @rolls[[x + dx, y + dy]]
      end

      count
    end
  end
end
