# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../aoc2025'

# Require all the days' code.
# This is a convenience for the `bin/console` script.
dir = File.expand_path('days', __dir__)
Dir.glob(File.join(dir, '*.rb')) { |file| require_relative(file) }
