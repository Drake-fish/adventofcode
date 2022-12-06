require 'pry'
class Tuner

  def initialize(file_path)
    @input = File.read(file_path)
  end

  def solve_part_1
    @input.split("").each.with_index(3) { |i, index| return index + 1 if all_uniq?(@input[index - 3..index]) }
  end

  def solve_part_2
    @input.split("").each.with_index(13) { |i, index| return index + 1 if all_uniq?(@input[index - 13..index]) }
  end

  def all_uniq?(array_of_chars)
    array_of_chars.split("").uniq.length == array_of_chars.length
  end
end


def time_it
  st = Time.now
  yield
  puts Time.now - st
end

puts("part 1:")
time_it do 
  puts Tuner.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_6/input.txt").solve_part_1
end


puts("part 2:")
time_it do 
  puts Tuner.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_6/input.txt").solve_part_2
end