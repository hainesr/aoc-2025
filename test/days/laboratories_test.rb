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

    assert_equal(15, @labs.instance_variable_get(:@grid_width))
    assert_equal(7, @labs.instance_variable_get(:@start_position))
    assert_equal(
      {
        2 => [7],
        4 => [6, 8],
        6 => [5, 7, 9],
        8 => [4, 6, 10],
        10 => [3, 5, 9, 11],
        12 => [2, 6, 12],
        14 => [1, 3, 5, 7, 9, 13]
      },
      @labs.instance_variable_get(:@spliters)
    )
  end

  def test_step_beams1
    @labs.setup(INPUT)

    beams = [[7, 0]]
    beams, splits = @labs.step_beams1(beams)

    assert_equal([[7, 1]], beams)
    assert_equal(0, splits)

    beams, splits = @labs.step_beams1(beams)

    assert_equal([[6, 2], [8, 2]], beams)
    assert_equal(1, splits)

    beams, splits = @labs.step_beams1(beams)

    assert_equal([[6, 3], [8, 3]], beams)
    assert_equal(0, splits)

    beams, splits = @labs.step_beams1(beams)

    assert_equal([[5, 4], [7, 4], [9, 4]], beams)
    assert_equal(2, splits)
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
