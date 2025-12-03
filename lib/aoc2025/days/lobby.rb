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

    def part2
      @battery_banks.sum { |bank| high_joltage(bank, batteries: 12) }
    end

    def high_joltage(bank, batteries: 2)
      select = []

      while batteries.positive?
        battery = bank[..-batteries].max
        location = bank.index(battery) + 1
        bank = bank[location..]
        batteries -= 1
        select << battery.to_s
      end

      select.join.to_i
    end
  end
end
