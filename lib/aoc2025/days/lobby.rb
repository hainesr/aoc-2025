# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../../aoc2025'

module AOC2025
  class Lobby < Day
    def setup(input = read_input_file.chomp)
      @battery_banks = input.lines.map do |line|
        line.chomp.chars.map(&:to_i)
      end
    end

    def part1
      @battery_banks.sum { |bank| high_joltage(bank) }
    end

    def high_joltage(bank)
      tens = bank[...-1].max
      start = bank.index(tens) + 1
      (tens * 10) + bank[start..].max
    end
  end
end
