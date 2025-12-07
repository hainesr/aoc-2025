# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../../aoc2025'

module AOC2025
  class Laboratories < Day
    def setup(input = read_input_file.chomp)
      @start_position = nil
      @spliters = Hash.new { |h, k| h[k] = [] }

      input.lines(chomp: true).each_with_index do |line, y|
        line.chars.each_with_index do |char, x|
          case char
          when 'S'
            @start_position = x
          when '^'
            @spliters[y] << x
          end
        end
      end
    end

    def part1
      max_y = @spliters.keys.max
      splits = 0
      beams = [[@start_position, 0]]

      while beams.first[1] < max_y
        beams, new_splits = step_beams1(beams)
        splits += new_splits
      end

      splits
    end

    def step_beams1(beams)
      new_beams = []
      splits = 0

      beams.each do |(x, y)|
        # Beams always move down one row.
        new_y = y + 1

        # Check for splitters at the new position.
        if @spliters[new_y].include?(x)
          # Split the beam into two beams, left and right.
          splits += 1
          new_beams << [x - 1, new_y]
          new_beams << [x + 1, new_y]
        else
          # Continue the beam straight down.
          new_beams << [x, new_y]
        end
      end

      # Return the new beams (de-duplicated) and the number of splits that occurred.
      [new_beams.uniq, splits]
    end
  end
end
