# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

require_relative '../../aoc2025'

module AOC2025
  module Extra
    module CLI
      HEADER = 'Advent of Code 2025: '

      def self.parse_params(argv)
        return false if argv.empty?

        argv.map(&:to_i).each do |day|
          return false if day.negative? || day > 12
        end
      end

      def self.run_day(day)
        solution = AOC2025::DAY_MAP[day]
        title = day_title(solution, day)

        begin
          require_relative ::File.join('..', 'days', solution)
        rescue StandardError
          solution = 'day'
        end

        puts title
        AOC2025.class_from_day(solution).new.run
      end

      def self.day_title(solution, day)
        if solution.nil?
          HEADER + "Day #{day}"
        else
          HEADER + solution.split('_').map(&:capitalize).join(' ')
        end
      end
    end
  end
end
