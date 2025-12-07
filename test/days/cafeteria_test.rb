# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2025/days/cafeteria'

class AOC2025::CafeteriaTest < Minitest::Test
  INPUT = <<~EOI
    3-5
    10-14
    16-20
    12-18

    1
    5
    8
    11
    17
    32
  EOI

  def setup
    @cafe = AOC2025::Cafeteria.new
  end

  def test_setup
    @cafe.setup(INPUT)

    expected_ranges = [
      (3..5),
      (10..14),
      (16..20),
      (12..18)
    ]
    expected_ids = [1, 5, 8, 11, 17, 32]

    assert_equal(expected_ranges, @cafe.instance_variable_get(:@ranges))
    assert_equal(expected_ids, @cafe.instance_variable_get(:@ids))
  end

  def test_part1
    @cafe.setup(INPUT)

    assert_equal(3, @cafe.part1)
  end

  def test_part2
    @cafe.setup(INPUT)

    assert_equal(14, @cafe.part2)
  end
end
