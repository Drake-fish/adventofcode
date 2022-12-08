require 'pry'

class FileDeleter
  MAX_VALUE = 100_000
  DISK_SIZE = 70000000
  NEED_FREE = 30000000
  def initialize(file_path)
    @input = File.read(file_path)
    @file_system = {}
    @cwd = []
    @nesting = []
    @total = []
    @internal_values = []
  end

  def solve_part_1 
    current_directory = []
    files = {}
    @input.split("\n").each do |line|
      case line.split
      in ["$", "cd", ".."]
        current_directory.pop
      in ["$", "cd", dir]
        current_directory << dir
      in [/\d+/ => size, file]
        files[current_directory + [file]] = size.to_i
      else
        # no-op
      end
    end

    directories = Hash.new(0)
    files.each do |(*path, file), size|
      while(path.any?)
        directories[path.dup] += size
        path.pop
      end
    end
    candidates = directories.select do |path, size| 
      size <= 100_000
    end
    candidates.values.sum
  end

  def solve_part_2 
    current_directory = []
    files = {}
    @input.split("\n").each do |line|
      case line.split
      in ["$", "cd", ".."]
        current_directory.pop
      in ["$", "cd", dir]
        current_directory << dir
      in [/\d+/ => size, file]
        files[current_directory + [file]] = size.to_i
      else
        # no-op
      end
    end

    directories = Hash.new(0)
    files.each do |(*path, file), size|
      while(path.any?)
        directories[path.dup] += size
        path.pop
      end
    end
    current_free = DISK_SIZE - directories[["/"]]
    to_delete = NEED_FREE - current_free
    directories
      .values
      .select{|size| size > to_delete}
      .min
  end

end

def time_it
  st = Time.now
  yield
  puts Time.now - st
end

puts("part 1:")
time_it do 
  puts FileDeleter.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_7/input.txt").solve_part_1
end

puts("part 2:")
time_it do 
  puts FileDeleter.new("/Users/drakefish/Desktop/fun/adventofcode/2022/day_7/input.txt").solve_part_2
end

