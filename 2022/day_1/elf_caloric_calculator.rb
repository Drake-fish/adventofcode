require 'pry'
require 'benchmark'

class ElfCaloricCalculator
    def initialize(file_path)
        @elves = File.read(file_path)
    end

    def solve_part_1
        top_caloric_elf
    end

    def solve_part_2 
        top_3_caloric_elfs_total
    end

    def summmed_caloric_elves
        @elves.split("\n\n").map { |e| e.split("\n") }.map { |e_a| e_a.inject(0) { |sum, e| sum + e.to_i } }
    end

    def top_caloric_elf
        summmed_caloric_elves.max
    end

    def top_3_caloric_elfs_total
        summmed_caloric_elves.max(3).sum()
    end
end


puts(ElfCaloricCalculator.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_1/input.txt").solve_part_1)
puts(Benchmark.realtime { ElfCaloricCalculator.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_1/input.txt").solve_part_1})
puts(ElfCaloricCalculator.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_1/input.txt").solve_part_2)
puts(Benchmark.realtime { ElfCaloricCalculator.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_1/input.txt").solve_part_2})
