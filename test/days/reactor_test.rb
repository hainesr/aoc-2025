# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2025/days/reactor'

class AOC2025::ReactorTest < Minitest::Test
  INPUT = <<~EOI
    aaa: you hhh
    you: bbb ccc
    bbb: ddd eee
    ccc: ddd eee fff
    ddd: ggg
    eee: out
    fff: out
    ggg: out
    hhh: ccc fff iii
    iii: out
  EOI

  INPUT_2 = <<~EOI
    svr: aaa bbb
    aaa: fft
    fft: ccc
    bbb: tty
    tty: ccc
    ccc: ddd eee
    ddd: hub
    hub: fff
    eee: dac
    dac: fff
    fff: ggg hhh
    ggg: out
    hhh: out
  EOI

  def setup
    @reactor = AOC2025::Reactor.new
  end

  def test_setup
    @reactor.setup(INPUT)
    expected = {
      aaa: [:you, :hhh],
      you: [:bbb, :ccc],
      bbb: [:ddd, :eee],
      ccc: [:ddd, :eee, :fff],
      ddd: [:ggg],
      eee: [:out],
      fff: [:out],
      ggg: [:out],
      hhh: [:ccc, :fff, :iii],
      iii: [:out]
    }

    assert_equal(expected, @reactor.instance_variable_get(:@device_map))
  end

  def test_part1
    @reactor.setup(INPUT)

    assert_equal(5, @reactor.part1)
  end

  def test_part2
    @reactor.setup(INPUT_2)

    assert_equal(2, @reactor.part2)
  end
end
