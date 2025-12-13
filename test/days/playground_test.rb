# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2025/days/playground'

class AOC2025::PlaygroundTest < Minitest::Test
  INPUT = <<~EOI
    162,817,812
    57,618,57
    906,360,560
    592,479,940
    352,342,300
    466,668,158
    542,29,236
    431,825,988
    739,650,466
    52,470,668
    216,146,977
    819,987,18
    117,168,530
    805,96,715
    346,949,466
    970,615,88
    941,993,340
    862,61,35
    984,92,344
    425,690,689
  EOI

  def setup
    @playground = AOC2025::Playground.new
  end

  def test_setup
    @playground.setup(INPUT)
    junctions = @playground.instance_variable_get(:@junctions)
    junction_pairs = @playground.instance_variable_get(:@junction_pairs)

    assert_equal(20, junctions.size)
    assert_equal([162, 817, 812], junctions[0])
    assert_equal([425, 690, 689], junctions[19])

    assert_equal(190, junction_pairs.size)
    assert_equal([[162, 817, 812], [425, 690, 689]], junction_pairs[0])
    assert_equal([[162, 817, 812], [431, 825, 988]], junction_pairs[1])
    assert_equal([[906, 360, 560], [805, 96, 715]], junction_pairs[2])
  end

  def test_euclidean_distance
    dist = @playground.euclidean_distance([0, 0, 0], [3, 4, 0])

    assert_in_delta(5.0, dist, 0.0001)

    dist = @playground.euclidean_distance([1, 2, 3], [4, 6, 3])

    assert_in_delta(5.0, dist, 0.0001)

    dist = @playground.euclidean_distance([1, 2, 3], [4, 6, 7])

    assert_in_delta(6.4031, dist, 0.0001)
  end

  def test_part1
    @playground.setup(INPUT)

    assert_equal(40, @playground.part1(10))
  end

  def test_part2
    @playground.setup(INPUT)

    assert_equal(25_272, @playground.part2)
  end
end
