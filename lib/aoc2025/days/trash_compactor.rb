# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../../aoc2025'

module AOC2025
  class TrashCompactor < Day
    def setup(input = read_input_file.chomp)
      @lines = input.lines.map(&:chomp)
    end

    def part1
      calculate(parse_part1(@lines))
    end

    def parse_part1(lines)
      columns = []

      lines.each do |line|
        line.split.each_with_index do |cell, index|
          columns[index] ||= []
          num = cell.to_i
          columns[index] << (num.zero? ? cell.to_sym : num)
        end
      end

      columns
    end

    def calculate(columns)
      columns.sum do |column|
        operand = column.pop
        column.reduce(&operand)
      end
    end
  end
end
