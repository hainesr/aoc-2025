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

      ranges = ranges.map do |range|
        min, max = range.split('-').map(&:to_i)
        (min..max)
      end

      @ranges = merge_ranges(ranges)
      @ids = ids.map(&:to_i)
    end

    def part1
      @ids.count do |id|
        @ranges.any? { |range| range.cover?(id) }
      end
    end

    def part2
      @ranges.sum { |range| range.end - range.begin + 1 }
    end

    def merge_ranges(ranges)
      ranges = ranges.sort_by(&:begin)
      merged_ranges = []
      current_range = ranges.shift

      ranges.each do |range|
        if current_range.end >= range.begin - 1
          current_range = (current_range.begin..[current_range.end, range.end].max)
        else
          merged_ranges << current_range
          current_range = range
        end
      end
      merged_ranges << current_range

      merged_ranges
    end
  end
end
