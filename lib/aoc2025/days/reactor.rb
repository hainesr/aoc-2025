# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../../aoc2025'

module AOC2025
  class Reactor < Day
    def setup(input = read_input_file.chomp)
      @device_map = input.lines(chomp: true).to_h do |line|
        device, outputs = line.split(': ')
        [device.to_sym, outputs.split.map(&:to_sym)]
      end
    end

    def part1
      traverse(:you)
    end

    def part2
      memo = {}

      to_fft = traverse(:svr, :fft, memo)
      to_dac = traverse(:fft, :dac, memo)
      to_out = traverse(:dac, :out, memo)

      to_fft * to_dac * to_out
    end

    def traverse(start, end_device = :out, memo = {})
      key = [start, end_device].freeze
      return memo[key] if memo.key?(key)
      return memo[key] = 1 if start == end_device

      memo[key] = @device_map[start].sum do |next_device|
        next 0 if next_device == :out && end_device != :out

        traverse(next_device, end_device, memo)
      end
    end
  end
end
