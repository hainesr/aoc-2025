# Advent of Code 2025
## Robert Haines

My attempt at doing [Advent of Code 2025](http://adventofcode.com/2025) in Ruby, with tests and all the trimmings.

![Tests](https://github.com/hainesr/aoc-2025/workflows/Tests/badge.svg)
![Linter](https://github.com/hainesr/aoc-2025/workflows/Linter/badge.svg)
[![Maintainability](https://api.codeclimate.com/v1/badges/887b4897d901f2d695ca/maintainability)](https://codeclimate.com/github/hainesr/aoc-2025/maintainability)

### Setup

After cloning, and changing into the `aoc-2025` directory, run:

```shell
$ gem install bundler
$ bundle install
$ rake
```

This will set everything up and run all the tests.

#### Puzzle inputs

You'll need to download any puzzle inputs for days that you want to run. As requested, I haven't included puzzle inputs in this repository. Test data is included in the individual test cases.

Create a directory, `etc`, in the root of the `aoc-2025` directory and name the puzzle input file with the same pattern as the day it corresponds to. So for day 3, "Mull It Over", you'd create a file called `etc/mull_it_over.txt` and save the puzzle input in there.

### Usage

To run the solution for a particular day:

```shell
$ ./aoc-2025 <day>
```

Or via `rake`:

```shell
$ rake run <day>
```

You can run multiple days like this:

```shell
$ rake run <day_1> <day_2> ... <day_n>
```

### Licence

[Public Domain](http://unlicense.org).
