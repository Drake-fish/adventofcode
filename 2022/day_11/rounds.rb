require 'pry'
require_relative './monkey'

class Rounds 
  ROUNDS = 20
  PART_2_ROUNDS = 1000
  def initialize(file_path)
    @input = File.read(file_path)
    @monkeys = []
  end

  def create_monkeys(part_2 = false)
    @input.split("\n\n").each do |monkey|
      monkey_input = monkey.split("\n")
      @monkeys << Monkey.new(
        items: monkey_input[1].strip(),
        part_2: part_2,
        operation: monkey_input[2].strip(),
        test: monkey_input[3].strip(),
        true_monkey: monkey_input[4].strip(),
        false_monkey: monkey_input[5].strip()
      )
    end
  end

  def solve_part_2 
    create_monkeys(true)
    PART_2_ROUNDS.times do
      @monkeys.each do |monkey|
        @monkeys = monkey.inspect_and_throw_items(@monkeys)
      end
    end
    @monkeys.map(&:inspections).max(2).reduce(:*)
  end

  def solve_part_1 
    create_monkeys
    ROUNDS.times do
      @monkeys.each do |monkey|
        @monkeys = monkey.inspect_and_throw_items(@monkeys)
      end
    end
    @monkeys.map(&:inspections).max(2).reduce(:*)
  end
end



# def time_it
#   st = Time.now
#   yield
#   puts Time.now - st
# end

# puts("part 1:")
# time_it do 
#   puts Rounds.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_11/input.txt").solve_part_1
# end

