require 'pry'
class CampCleanup 

  def initialize(file_path)
    @inputs = File.read(file_path)
  end

  def solve_part_1
    @inputs.split("\n").map { |i| change_input_to_range(i) }.map { |i| compare_inputs(i[0], i[1]) }.count(true)
  end

  def solve_part_2
    @inputs.split("\n").map { |i| change_input_to_range(i) }.map { |i| compare_inputs_flexible(i[0], i[1]) }.count(true)
  end

  def change_input_to_range(input)
    split_input = input.split(",")
    split_input.map { |i| i.split("-").map { |i| i.to_i } }.map { |i| (i[0]..i[1]) }
  end

  def compare_inputs(input1, input2)
    (input2.to_a - input1.to_a).empty? || (input1.to_a - input2.to_a).empty?
  end
end

def compare_inputs_flexible(input1, input2)
  (input1.to_a & input2.to_a).any?
end

def time_it
  st = Time.now
  yield
  puts Time.now - st
end

puts("part 1:")
time_it do 
    puts CampCleanup.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_4/input.txt").solve_part_1
end


puts("part 2:")
time_it do 
    puts CampCleanup.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_4/input.txt").solve_part_2
end

