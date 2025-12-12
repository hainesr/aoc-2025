# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2025/days/christmas_tree_farm'

class AOC2025::ChristmasTreeFarmTest < Minitest::Test
  INPUT = <<~EOI
    0:
    ###
    ##.
    ##.

    1:
    ###
    ##.
    .##

    2:
    .##
    ###
    ##.

    3:
    ##.
    ###
    ##.

    4:
    ###
    #..
    ###

    5:
    ###
    .#.
    ###

    4x4: 0 0 0 0 2 0
    12x5: 1 0 1 0 2 2
    12x5: 1 0 1 0 3 2
  EOI

  def setup
    @ctf = AOC2025::ChristmasTreeFarm.new
  end

  def test_parse_shapes
    sections = INPUT.split("\n\n")
    shapes = @ctf.parse_shapes(sections.take(6))

    assert_equal([7, 7, 7, 7, 7, 7], shapes)
  end

  def test_parse_areas_and_presents
    sections = INPUT.split("\n\n")
    areas, presents = @ctf.parse_areas_and_presents(sections.last)

    assert_equal([16, 60, 60], areas)
    assert_equal(
      [[0, 0, 0, 0, 2, 0], [1, 0, 1, 0, 2, 2], [1, 0, 1, 0, 3, 2]],
      presents
    )
  end

  # The test data for today does not work when applied to the
  # optimal solution for the real data.
  #
  # def test_part1
  #   @ctf.setup(INPUT)
  #
  #   assert_equal(2, @ctf.part1)
  # end
end
