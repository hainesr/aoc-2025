# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2025/days/lobby'

class AOC2025::LobbyTest < Minitest::Test
  INPUT = <<~EOI
    987654321111111
    811111111111119
    234234234234278
    818181911112111
  EOI

  def setup
    @lobby = AOC2025::Lobby.new
  end

  def test_setup
    @lobby.setup(INPUT)
    expected = [
      [9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1],
      [8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9],
      [2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 7, 8],
      [8, 1, 8, 1, 8, 1, 9, 1, 1, 1, 1, 2, 1, 1, 1]
    ]

    assert_equal expected, @lobby.instance_variable_get(:@battery_banks)
  end

  def test_high_joltage
    assert_equal(98, @lobby.high_joltage([9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1]))
    assert_equal(89, @lobby.high_joltage([8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9]))
    assert_equal(78, @lobby.high_joltage([2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 7, 8]))
    assert_equal(92, @lobby.high_joltage([8, 1, 8, 1, 8, 1, 9, 1, 1, 1, 1, 2, 1, 1, 1]))
  end

  def test_high_joltage_part2
    assert_equal(
      987_654_321_111,
      @lobby.high_joltage([9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1], batteries: 12)
    )
    assert_equal(
      811_111_111_119,
      @lobby.high_joltage([8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9], batteries: 12)
    )
    assert_equal(
      434_234_234_278,
      @lobby.high_joltage([2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 7, 8], batteries: 12)
    )
    assert_equal(
      888_911_112_111,
      @lobby.high_joltage([8, 1, 8, 1, 8, 1, 9, 1, 1, 1, 1, 2, 1, 1, 1], batteries: 12)
    )
  end

  def test_part1
    @lobby.setup(INPUT)
    expected = 98 + 89 + 78 + 92

    assert_equal(expected, @lobby.part1)
  end

  def test_part2
    @lobby.setup(INPUT)
    expected = 987_654_321_111 +
               811_111_111_119 +
               434_234_234_278 +
               888_911_112_111

    assert_equal(expected, @lobby.part2)
  end
end
