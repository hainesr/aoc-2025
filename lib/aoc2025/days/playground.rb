# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../../aoc2025'
require_relative '../common/disjoint_set'

module AOC2025
  class Playground < Day
    def setup(input = read_input_file.chomp)
      @junctions = input.lines(chomp: true).map do |line|
        line.split(',').map(&:to_i)
      end

      @junction_pairs = @junctions.combination(2).to_a.sort_by do |u, v|
        euclidean_distance(u, v)
      end
    end

    def part1(num_connections = 1000)
      ds = Common::DisjointSet.new(@junctions)

      @junction_pairs.take(num_connections).each do |u, v|
        ds.union(u, v)
      end

      sizes = ds.parent.each_value.map do |root|
        ds.size(root)
      end

      sizes.uniq.sort.reverse.take(3).reduce(:*)
    end

    def euclidean_distance(u, v)
      Math.sqrt(((u[0] - v[0])**2) + ((u[1] - v[1])**2) + ((u[2] - v[2])**2))
    end
  end
end
