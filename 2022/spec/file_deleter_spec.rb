require_relative './spec_helper'
require_relative '../day_7/file_deleter'

describe "FileDeleter" do 
  let(:file_deleter) { FileDeleter.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_7_input.txt") }
  describe "solve_part_1" do
    it "should solve part 1" do 
      expect(file_deleter.solve_part_1).to eq(95437)
    end
  end
end