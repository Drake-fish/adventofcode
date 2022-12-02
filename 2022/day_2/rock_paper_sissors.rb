require 'pry'
require 'benchmark'

class RockPaperSissors 
    POINTS = {
        "X" => 1,
        "Y" => 2,
        "Z" => 3,
    }

    WIN = 6
    DRAW = 3
    LOSE = 0

    NEED_LOSE = "X"
    NEED_DRAW = "Y"
    NEED_WIN = "Z"

    def initialize(file_path)
        @inputs = File.read(file_path)
    end

    def solve_part_1
        @inputs.split("\n").map { |i| i.split(" ") }.map { |i| play_round(i[0], i[1]) }.sum
    end

    def solve_part_2
        @inputs.split("\n").map { |i| i.split(" ") }.map { |i| play_fixed_round(i[0], i[1]) }.sum
    end

    def play_fixed_round(a,b)
        if b == NEED_LOSE
            losing_shape = losing_combinations.select { |c| c[0] == a }[0][1]
            LOSE + POINTS[losing_shape]
        elsif b == NEED_DRAW
            draw_shape = draw_combinations.select { |c| c[0] == a }[0][1]
            DRAW + POINTS[draw_shape]
        elsif b == NEED_WIN
            winning_shape = winning_combinations.select { |c| c[0] == a }[0][1]
            WIN + POINTS[winning_shape]
        end
    end

    def play_round(a, b)
        if win?(a, b)
            WIN + POINTS[b]
        elsif draw?(a, b)
            DRAW + POINTS[b]
        else
            LOSE + POINTS[b]
        end
    end

    def win?(a, b)
        winning_combinations.include?([a, b])
    end

    def draw?(a, b)
        draw_combinations.include?([a, b])
    end

    def draw_combinations
        [["A", "X"], ["B", "Y"], ["C", "Z"]]
    end

    def winning_combinations
        [["A", "Y"], ["B", "Z"], ["C", "X"]]
    end

    def losing_combinations 
        [["A", "Z"], ["B", "X"], ["C", "Y"]]
    end
end

puts(RockPaperSissors.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_2/input.txt").solve_part_1)
puts(Benchmark.realtime { RockPaperSissors.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_2/input.txt").solve_part_1})
puts(RockPaperSissors.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_2/input.txt").solve_part_2)
puts(Benchmark.realtime { RockPaperSissors.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_2/input.txt").solve_part_2})
