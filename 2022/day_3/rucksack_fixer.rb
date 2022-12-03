require 'pry'
class RuckSackFixer 

  def initialize(file_path)
    @inputs = File.read(file_path)
  end

  def solve_part_1
    @inputs.split("\n").map { |i| split_input(i) }.map { |i| matching_letters(i) }.map { |i| get_letter_value(i[0], get_letters_index(i[0])) }.sum
  end

  def solve_part_2 
    groups_of_3.map { |i| matching_input(i) }.map { |i| get_letter_value(i[0], get_letters_index(i[0])) }.sum
  end

  def split_input(input)
    first_part = input.split("").slice(0, input.length/2)
    second_part = input.split("").slice(input.length/2, input.length)
    [first_part, second_part]
  end

  def groups_of_3
    @inputs.split("\n").each_slice(3).to_a
  end

  def matching_input(input)
    input[0].split("") & input[1].split("") & input[2].split("")
  end

  def matching_letters(split_input)
    split_input[0] & split_input[1]
  end

  def get_letters_index(letter)
    index = ("a".."z").to_a.index(letter[0].downcase) + 1
  end

  def get_letter_value(letter, index)
    if ("A".."Z").include?(letter[0])
      index + 26
    else
      index
    end
  end
end

def time_it
  st = Time.now
  yield
  puts Time.now - st
end

puts("part 1:")
time_it do 
    puts RuckSackFixer.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_3/input.txt").solve_part_1
end


puts("part 2:")
time_it do 
    puts RuckSackFixer.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_3/input.txt").solve_part_2
end

