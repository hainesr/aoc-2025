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

  def test_setup
    @labs.setup(INPUT)

    assert_equal(7, @labs.instance_variable_get(:@start_position))
    assert_equal(
      [
        [7, 2],
        [6, 4], [8, 4],
        [5, 6], [7, 6], [9, 6],
        [4, 8], [6, 8], [10, 8],
        [3, 10], [5, 10], [9, 10], [11, 10],
        [2, 12], [6, 12], [12, 12],
        [1, 14], [3, 14], [5, 14], [7, 14], [9, 14], [13, 14]
      ], @labs.instance_variable_get(:@spliters)
    )
  end

  def test_step_beams
    @labs.setup(INPUT)

    beams = [[7, 0]]
    beams, splits = @labs.step_beams(beams)

    assert_equal([[7, 1]], beams)
    assert_equal(0, splits)

    beams, splits = @labs.step_beams(beams)

    assert_equal([[6, 2], [8, 2]], beams)
    assert_equal(1, splits)

    beams, splits = @labs.step_beams(beams)

    assert_equal([[6, 3], [8, 3]], beams)
    assert_equal(0, splits)

    beams, splits = @labs.step_beams(beams)

    assert_equal([[5, 4], [7, 4], [9, 4]], beams)
    assert_equal(2, splits)
  end

  def test_part1
    @labs.setup(INPUT)

    assert_equal(21, @labs.part1)
  end
end
