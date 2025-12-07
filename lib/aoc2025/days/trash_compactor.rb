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

    def part2
      calculate(parse_part2(@lines))
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

    def parse_part2(lines)
      columns = []
      index = 0
      num_max = lines.length - 1
      lines = lines.map(&:reverse)

      while index < lines.first.length
        operator = nil
        column = []
        (0..4).each do |i|
          num = (0..num_max).map do |line|
            lines[line][index + i]
          end

          break if num.all?(' ') || num.all?(&:nil?)

          operator = num.pop.to_sym if num[num_max] != ' '
          column << num.join.to_i
        end

        column << operator unless operator.nil?
        columns << column
        index += column.length
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
