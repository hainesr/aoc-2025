# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../../aoc2025'

module AOC2025
  class Laboratories < Day
    def setup(input = read_input_file.chomp)
      start_position = nil
      splitters = Hash.new { |h, k| h[k] = [] }

      input.lines(chomp: true).each_with_index do |line, y|
        line.chars.each_with_index do |char, x|
          case char
          when 'S'
            start_position = x
          when '^'
            splitters[y] << x
          end
        end
      end

      @splits, @beam_counts = step_beams(splitters, start_position)
    end

    def part1
      @splits
    end

    def part2
      @beam_counts
    end

    def step_beams(splitters, start_position)
      beam_counts = [0] * ((start_position * 2) + 1)
      beam_counts[start_position] = 1
      splits = 0

      (0..splitters.keys.max).each do |y|
        next unless splitters.key?(y)

        splitters[y].each do |x|
          count = beam_counts[x]
          splits += 1 if count.positive?
          beam_counts[x] = 0
          beam_counts[x - 1] += count
          beam_counts[x + 1] += count
        end
      end

      [splits, beam_counts.sum]
    end
  end
end
