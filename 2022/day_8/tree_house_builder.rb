require "pry"

class TreeHouseBuilder 
  def initialize(file_path)
    @input = File.read(file_path).split("\n").map { |row| row.split("").map(&:to_i) }
  end

  def solve_part_1 
    look_all_ways
  end

  def solve_part_2 
    tree_scenic_scores
  end

  def look_all_ways
    total = 0
    @input.each.with_index do |row, col_index|
      row.each.with_index do |item, row_index|
        column = @input.map { |col| col[row_index] }
        item = row[row_index]
        if look_left_or_up(row, row_index, item) || look_right_or_down(row, row_index, item)
          total += 1
        elsif look_left_or_up(column, col_index, item) || look_right_or_down(column, col_index, item)
          total += 1
        end
      end
    end
    total
  end

  def tree_scenic_scores 
    scores = []
    binding.pry
    total = 0
    @input.each.with_index do |row, col_index|
      row.each.with_index do |item, row_index|
        column = @input.map { |col| col[row_index] }
        item = row[row_index]
        left = look_left_or_up_full(row, row_index, item)
        right = look_right_or_down(row, row_index, item)
        up = look_left_or_up(column, col_index, item)
        down = look_right_or_down(column, col_index, item)
      end
    end
  end

  def look_left_or_up(arr, index, item)
    return true if index == arr.length - 1 || index == 0
    arr[0..(index - 1)].max < item
  end

  def look_right_or_down(arr, index, item)
    return true if index == arr.length - 1 || index == 0
    arr[(index + 1)..arr.length].max < item
  end

  def look_left_or_up_full(arr, index, item)
    return 0 if index == arr.length - 1 || index == 0
    binding.pry
    arr[0..(index - 1)]
    
  end
end

def time_it
  st = Time.now
  yield
  puts Time.now - st
end

puts("part 1:")
time_it do 
  puts TreeHouseBuilder.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_8/input.txt").solve_part_1
end


def time_it
  st = Time.now
  yield
  puts Time.now - st
end

puts("part 1:")
time_it do 
  puts TreeHouseBuilder.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_8/input.txt").solve_part_2
end