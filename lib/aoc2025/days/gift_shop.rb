# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../../aoc2025'

module AOC2025
  class GiftShop < Day
    def setup(input = read_input_file.chomp)
      @ranges = input.split(',').map do |range|
        start, stop = range.split('-')
        Range.new(start, stop)
      end
    end

    def part1
      total = 0

      @ranges.each do |range|
        range.each do |num|
          next if num.length.odd?

          mid_point = num.length / 2
          total += num.to_i if num[0, mid_point] == num[mid_point, mid_point]
        end
      end

      total
    end

    def part2
      total = 0

      @ranges.each do |range|
        range.each do |num|
          total += num.to_i if (num + num)[1..-2].include?(num)
        end
      end

      total
    end
  end
end
