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

    def traverse(start, end_device = :out, visited = [])
      return 1 if start == end_device

      total_paths = 0
      @device_map[start].each do |next_device|
        next if visited.include?(next_device)

        total_paths += traverse(next_device, end_device, visited + [start])
      end

      total_paths
    end
  end
end
