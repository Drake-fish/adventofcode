require 'pry'
class SupplyStack 
  def initialize(file_path, crates)
    @instructions = File.read(file_path)
    @crates = crates
  end

  def solve_part_1
    @instructions.split("\n").map { |i| read_instructions(i) }.map { |i| move(i, 9000) }
    get_top_letters
  end

  def solve_part_2 
    @instructions.split("\n").map { |i| read_instructions(i) }.map { |i| move(i, 9001) }
    get_top_letters
  end

  def read_instructions(instruction) 
    instruction.slice!("move")
    instruction.slice!("from")
    instruction.slice!("to")
    instruction.split(" ").map(&:to_i)
  end

  def move(instructions, crate_mover_version)
    letters = @crates[0][instructions[1] - 1].slice!(0, instructions[0])
    if crate_mover_version == 9000
     letters = letters.reverse!
    end
    @crates[0][instructions[2] - 1] = letters + @crates[0][instructions[2] - 1]
    @crates
  end

  def get_top_letters
    @crates.map { |i| i.map { |i| i[0] } }.flatten.join("")
  end
end

def time_it
  st = Time.now
  yield
  puts Time.now - st
end

crates = [["DTWNL","HCP","JMGDNHPW","LQTNSWC","NCHP","BQWMDNHT","LSGJRBM","TRBVGWNZ","LPNDGW"]]


puts("part 1:")
time_it do 
    puts SupplyStack.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_5/input.txt", crates).solve_part_1
end


puts("part 2:")
time_it do 
    puts SupplyStack.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_5/input.txt", crates).solve_part_2
end


