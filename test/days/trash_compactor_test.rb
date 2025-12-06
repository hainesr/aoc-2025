# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2025/days/trash_compactor'

class AOC2025::TrashCompactorTest < Minitest::Test
  INPUT = <<~EOI
    123 328  51 64
     45 64  387 23
      6 98  215 314
    *   +   *   +
  EOI

  def setup
    @tc = AOC2025::TrashCompactor.new
  end

  def test_setup
    @tc.setup(INPUT)

    expected_columns = [
      [123, 45, 6, :*],
      [328, 64, 98, :+],
      [51, 387, 215, :*],
      [64, 23, 314, :+]
    ]

    assert_equal(expected_columns, @tc.instance_variable_get(:@columns))
  end

  def test_part1
    @tc.setup(INPUT)

    assert_equal(4_277_556, @tc.part1)
  end
end
