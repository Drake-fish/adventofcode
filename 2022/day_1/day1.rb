require 'pry'

def parse_file_into_string(file_path)
    File.read(file_path)
end

def summed_caloric_elves(file_path)
    elves = parse_file_into_string(file_path)
    elves.split("\n\n").map { |e| e.split("\n") }.map { |e_a| e_a.inject(0) { |sum, e| sum + e.to_i } }
end

def top_caloric_elf(summed_elves_array)
    summed_elves_array.max
end

def top_3_caloric_elfs_total(summed_elves_array)
    summed_elves_array.max(3).sum()
end

