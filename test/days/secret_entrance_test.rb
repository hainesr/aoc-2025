# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2025/days/secret_entrance'

class AOC2025::SecretEntranceTest < Minitest::Test
  INPUT = <<~EOI
    L68
    L30
    R48
    L5
    R60
    L55
    L1
    L99
    R14
    L82
  EOI

  def setup
    @se = AOC2025::SecretEntrance.new
  end

  def test_setup
    @se.setup(INPUT)
    expected = [-68, -30, 48, -5, 60, -55, -1, -99, 14, -82]

    assert_equal(expected, @se.instance_variable_get(:@rotations))
  end

  def test_part1
    @se.setup(INPUT)

    assert_equal(3, @se.part1)
  end
end
