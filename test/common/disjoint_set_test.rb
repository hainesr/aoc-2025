# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2025/common/disjoint_set'

class AOC2025::DisjointSetTest < Minitest::Test
  def test_initialize
    ds = AOC2025::Common::DisjointSet.new([1, 2, 3, 3])

    assert_equal(3, ds.parent.size)
    assert_equal(1, ds.find(1))
    assert_equal(2, ds.find(2))
    assert_equal(3, ds.find(3))
  end

  def test_make_set
    ds = AOC2025::Common::DisjointSet.new(['a', 'b'])

    assert_equal(2, ds.parent.size)

    ds.make_set('c')

    assert_equal(3, ds.parent.size)
    assert_equal('c', ds.find('c'))

    ds.make_set('a')

    assert_equal(3, ds.parent.size)
  end

  def test_union
    ds = AOC2025::Common::DisjointSet.new([1, 2, 3, 4])
    ds.union(1, 2)

    assert_equal(ds.find(1), ds.find(2))
    refute_equal(ds.find(1), ds.find(3))
    assert_equal(2, ds.size(1))
    assert_equal(2, ds.size(2))

    ds.union(3, 4)

    assert_equal(ds.find(3), ds.find(4))
    refute_equal(ds.find(1), ds.find(3))
    assert_equal(2, ds.size(3))

    ds.union(2, 3)

    assert_equal(ds.find(1), ds.find(4))
    assert_equal(4, ds.size(1))
    assert_equal(4, ds.size(2))
  end
end
