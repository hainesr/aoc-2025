# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2025/days/printing_department'

class AOC2025::PrintingDepartmentTest < Minitest::Test
  INPUT = <<~EOI
    ..@@.@@@@.
    @@@.@.@.@@
    @@@@@.@.@@
    @.@@@@..@.
    @@.@@@@.@@
    .@@@@@@@.@
    .@.@.@.@@@
    @.@@@.@@@@
    .@@@@@@@@.
    @.@.@@@.@.
  EOI

  def setup
    @pd = AOC2025::PrintingDepartment.new
  end

  def test_setup
    @pd.setup(INPUT)
    rolls = @pd.instance_variable_get(:@rolls)

    assert(rolls[[2, 0]])
    assert(rolls[[0, 1]])
    assert(rolls[[8, 9]])
    refute(rolls[[0, 0]])
    refute(rolls[[9, 9]])
    refute(rolls[[-1, 20]])
  end

  def test_accessible?
    @pd.setup(INPUT)

    assert(@pd.accessible?(2, 0))
    refute(@pd.accessible?(1, 1))
    assert(@pd.accessible?(0, 1))
    assert(@pd.accessible?(0, 9))
  end

  def test_part1
    @pd.setup(INPUT)

    assert_equal(13, @pd.part1)
  end
end
