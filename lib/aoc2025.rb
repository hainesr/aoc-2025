# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require 'rubygems'
require 'bundler/setup'

require_relative 'aoc2025/day'

module AOC2025
  INPUT_DIR = ::File.expand_path('../etc', __dir__)

  DAY_MAP = [
    'there_is_no_day_zero', # Day 0
    'secret_entrance',
    'gift_shop',
    'lobby',
    'printing_department',
    'cafeteria',            # Day 5
    'trash_compactor',
    'laboratories',
    nil,
    nil,
    nil,                    # Day 10
    nil,
    'christmas_tree_farm'
  ].freeze

  def self.class_from_day(day)
    class_name = day.split('_').map(&:capitalize).join
    class_path = "AOC2025::#{class_name}"
    class_path.split('::').reduce(Object) { |o, c| o.const_get c }
  end
end
