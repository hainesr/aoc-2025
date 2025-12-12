# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../../aoc2025'

module AOC2025
  class ChristmasTreeFarm < Day
    def setup(input = read_input_file.chomp)
      sections = input.split("\n\n")
      @shapes = parse_shapes(sections.take(6))
      areas, presents = parse_areas_and_presents(sections.last)
      @regions = areas.zip(presents)
    end

    def part1
      @regions.count do |area, present_counts|
        present_counts.zip(@shapes).sum { |count, shape| count * shape } <= area
      end
    end

    def parse_shapes(shape_sections)
      shape_sections.map do |section|
        lines = section.lines(chomp: true)
        lines.shift # Ignore the shape number line.
        lines.sum do |line|
          line.chars.count { |c| c == '#' }
        end
      end
    end

    def parse_areas_and_presents(area_section)
      areas = []
      presents = []

      area_section.lines(chomp: true).each do |line|
        area, present_counts = line.split(': ')
        areas << area.split('x').map(&:to_i).reduce(1, :*)
        presents << present_counts.split.map(&:to_i)
      end

      [areas, presents]
    end
  end
end
