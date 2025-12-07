# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2025/days/laboratories'

class AOC2025::LaboratoriesTest < Minitest::Test
  INPUT = <<~EOI
    .......S.......
    ...............
    .......^.......
    ...............
    ......^.^......
    ...............
    .....^.^.^.....
    ...............
    ....^.^...^....
    ...............
    ...^.^...^.^...
    ...............
    ..^...^.....^..
    ...............
    .^.^.^.^.^...^.
    ...............
  EOI

  def setup
    @labs = AOC2025::Laboratories.new
  end

  def test_step_beams
    splitters = {
      2 => [7],
      4 => [6, 8],
      6 => [5, 7, 9],
      8 => [4, 6, 10],
      10 => [3, 5, 9, 11],
      12 => [2, 6, 12],
      14 => [1, 3, 5, 7, 9, 13]
    }
    splits, beam_counts = @labs.step_beams(splitters, 7)

    assert_equal(21, splits)
    assert_equal(40, beam_counts)
  end

  def test_part1
    @labs.setup(INPUT)

    assert_equal(21, @labs.part1)
  end

  def test_part2
    @labs.setup(INPUT)

    assert_equal(40, @labs.part2)
  end
end
