# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../../aoc2025'

module AOC2025
  class SecretEntrance < Day
    DIAL_SIZE = 100

    def setup(input = read_input_file.chomp)
      @rotations = input.lines.map do |line|
        dir = line[0]
        steps = line[1..].to_i
        dir == 'L' ? -steps : steps
      end
    end

    def part1
      pos = 50
      zeros = 0

      @rotations.each do |rotation|
        pos = (pos + rotation) % DIAL_SIZE
        zeros += 1 if pos.zero?
      end

      zeros
    end

    def part2
      pos = 50
      zeros = 0

      @rotations.each do |rotation|
        saved_pos = pos
        crossed_zeros, pos = (pos + rotation).divmod(DIAL_SIZE)
        crossed_zeros = crossed_zeros.abs

        crossed_zeros -= 1 if pos.zero? && rotation.positive?
        crossed_zeros -= 1 if saved_pos.zero? && rotation.negative?
        crossed_zeros += 1 if pos.zero?

        zeros += crossed_zeros
      end

      zeros
    end
  end
end
