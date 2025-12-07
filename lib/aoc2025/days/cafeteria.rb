# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../../aoc2025'

module AOC2025
  class Cafeteria < Day
    def setup(input = read_input_file.chomp)
      ranges, ids = input.split("\n\n").map { |section| section.split("\n") }

      @ranges = ranges.map do |range|
        min, max = range.split('-').map(&:to_i)
        (min..max)
      end

      @ids = ids.map(&:to_i)
    end

    def part1
      @ids.count do |id|
        @ranges.any? { |range| range.cover?(id) }
      end
    end
  end
end
