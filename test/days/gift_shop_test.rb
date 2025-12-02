# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2025/days/gift_shop'

class AOC2025::GiftShopTest < Minitest::Test
  INPUT = '11-22,95-115,998-1012,1188511880-1188511890,222220-222224,' \
          '1698522-1698528,446443-446449,38593856-38593862,565653-565659,' \
          '824824821-824824827,2121212118-2121212124'

  def setup
    @gs = AOC2025::GiftShop.new
  end

  def test_setup
    @gs.setup(INPUT)

    assert_equal(
      [
        ('11'..'22'), ('95'..'115'), ('998'..'1012'), ('1188511880'..'1188511890'),
        ('222220'..'222224'), ('1698522'..'1698528'), ('446443'..'446449'),
        ('38593856'..'38593862'), ('565653'..'565659'), ('824824821'..'824824827'),
        ('2121212118'..'2121212124')
      ],
      @gs.instance_variable_get(:@ranges)
    )
  end

  def test_part1
    @gs.setup(INPUT)

    assert_equal(1_227_775_554, @gs.part1)
  end
end
