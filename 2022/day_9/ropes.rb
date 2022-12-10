require 'pry'
class Ropes 
  def initialize(file_path) 
    @input = File.read(file_path)
    @moves = {}
  end

  def solve_part_1 
    move_head([500,500], [500,500])
    @moves.keys.size
  end

  def move_head(head_coordinates, tail_coordinates)
    @input.split("\n").each do |line|
      num = line.split[1].to_i
      command = line.split[0]
      case command
      when "R"
        num.times do 
          head_coordinates[0] += 1
          move_tail_and_record(head_coordinates, tail_coordinates)
        end
      when "L"
        num.times do 
          head_coordinates[0] -= 1
          move_tail_and_record(head_coordinates, tail_coordinates) 
        end
      when "U"
        num.to_i.times do 
          head_coordinates[1] += 1
          move_tail_and_record(head_coordinates, tail_coordinates) 
        end
      when "D"
        num.to_i.times do
          head_coordinates[1] -= 1
          move_tail_and_record(head_coordinates, tail_coordinates) 
        end
      else
        # no-op
      end
    end
    head_coordinates
  end

  def move_tail_and_record(head_coordinates, tail_coordinates)
    if (head_coordinates[0] - tail_coordinates[0] == 1 && head_coordinates[1] - tail_coordinates[1] == 2) || (head_coordinates[0] - tail_coordinates[0] == 2 && head_coordinates[1] - tail_coordinates[1] == 1)
      tail_coordinates[0] += 1
      tail_coordinates[1] += 1
    elsif (head_coordinates[0] - tail_coordinates[0] == -1 && head_coordinates[1] - tail_coordinates[1] == 1)
      tail_coordinates[0] -= 1
      tail_coordinates[1] += 1
    elsif (tail_coordinates[0] - head_coordinates[0] == 1 && tail_coordinates[1] - head_coordinates[1] == 2) || (tail_coordinates[0] - head_coordinates[0] == 2 && tail_coordinates[1] - head_coordinates[1] == 1)
      tail_coordinates[0] -= 1
      tail_coordinates[1] -= 1
    elsif head_coordinates[0] - tail_coordinates[0] > 1
      tail_coordinates[0] += 1
    elsif head_coordinates[1] - tail_coordinates[1] > 1
      tail_coordinates[1] += 1
    elsif tail_coordinates[0] - head_coordinates[0] > 1 
      tail_coordinates[0] -= 1
    elsif tail_coordinates[1] - head_coordinates[1] > 1
      tail_coordinates[1] -= 1
    end
    record_move(tail_coordinates)
    return tail_coordinates
  end

  def record_move(tail_coordinates)
    @moves[tail_coordinates.join(",")] = "#"
  end
end

def time_it
  st = Time.now
  yield
  puts Time.now - st
end

puts("part 1:")
time_it do 
  puts Ropes.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_9/input.txt").solve_part_1
end

