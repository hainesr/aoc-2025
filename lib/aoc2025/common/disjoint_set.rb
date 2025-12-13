# frozen_string_literal: true

# Advent of Code 2025
#
# Robert Haines
#
# Public Domain

module AOC2025
  module Common
    class DisjointSet
      attr_reader :parent

      def initialize(roots = [])
        @parent = {}
        @size = {}
        roots.each { |root| make_set(root) }
      end

      def make_set(x)
        @parent[x] = x
        @size[x] = 1
      end

      def find(x)
        return x if @parent[x] == x

        @parent[x] = find(@parent[x])
        @parent[x]
      end

      def union(x, y)
        root_x = find(x)
        root_y = find(y)

        return if root_x == root_y

        if @size[root_x] < @size[root_y]
          @parent[root_x] = root_y
          @size[root_y] += @size[root_x]
        else
          @parent[root_y] = root_x
          @size[root_x] += @size[root_y]
        end
      end

      def size(x)
        @size[find(x)]
      end
    end
  end
end
