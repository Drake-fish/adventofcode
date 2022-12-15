require 'pry'

class RayTube
  def initialize(file_path) 
    @input = File.read(file_path)
    @counter = 0
    @total = 1
    @special_values = [20, 60, 100, 140, 180, 220]
    @part_2_special_values = [40, 80, 120, 160, 200, 240]
    @running_total = 0
    @matrix = [[]]
    @matrix_y = 0
    @sprite_starting_index = 1
  end

  def solve_part_1 
    @input.split("\n").each do |line|
      if line == "noop"
        noop
      elsif line.include?("addx")
        addx(line.split(" ")[1].to_i)
      end
    end
    @running_total
  end

  def solve_part_2
    @input.split("\n").each do |line|
      if line == "noop"
        noop
      elsif line.include?("addx")
        addx(line.split(" ")[1].to_i)
      end
    end
    binding.pry
    @matrix
  end

  def noop
    special_value?
    part_2_special_value?
    draw_cpt
    @counter += 1
  end

  def addx(num)
    special_value?
    part_2_special_value?
    draw_cpt
    @counter += 1
    special_value?
    part_2_special_value?
    draw_cpt
    @counter += 1
    @total += num
    move_sprite
  end

  def special_value?
    if @special_values.include?(@counter)
      @running_total += @total * @counter
    end
  end

  def part_2_special_value?
    if @part_2_special_values.include?(@counter)
      @matrix << []
      puts @matrix[@matrix_y].join
      @matrix_y += 1
      @counter = 0
    end
  end

  def draw_cpt 
    @matrix[@matrix_y].push((value_overlaps_sprite? ? "#" : "."))
  end

  def value_overlaps_sprite?
    (@counter).between?(@sprite_starting_index, @sprite_starting_index + 3)
  end

  def move_sprite
    @sprite_starting_index = @total
  end
end



def time_it
  st = Time.now
  yield
  puts Time.now - st
end

puts("part 1:")
time_it do 
  puts RayTube.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_10/input.txt").solve_part_1
end

