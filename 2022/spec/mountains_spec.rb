require_relative './spec_helper'
require_relative '../day_12/mountains'

describe "Mountains" do 
  let(:mt) { Mountains.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_12_input.txt") }
  describe "solve_part_1" do 
    it "works for the example" do 
      expect(mt.solve_part_1).to eq(31)
    end
  end
end