# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2025/days/trash_compactor'

class AOC2025::TrashCompactorTest < Minitest::Test
  INPUT = "123 328  51 64 \n 45 64  387 23 \n  6 98  215 314\n*   +   *   +  \n"

  def setup
    @tc = AOC2025::TrashCompactor.new
  end

  def test_parse_part1
    @tc.setup(INPUT)

    expected_columns = [
      [123, 45, 6, :*],
      [328, 64, 98, :+],
      [51, 387, 215, :*],
      [64, 23, 314, :+]
    ]

    assert_equal(expected_columns, @tc.parse_part1(@tc.instance_variable_get(:@lines)))
  end

  def test_parse_part2
    @tc.setup(INPUT)

    expected_columns = [
      [4, 431, 623, :+],
      [175, 581, 32, :*],
      [8, 248, 369, :+],
      [356, 24, 1, :*]
    ]

    assert_equal(expected_columns, @tc.parse_part2(@tc.instance_variable_get(:@lines)))
  end

  def test_part1
    @tc.setup(INPUT)

    assert_equal(4_277_556, @tc.part1)
  end

  def test_part2
    @tc.setup(INPUT)

    assert_equal(3_263_827, @tc.part2)
  end
end
