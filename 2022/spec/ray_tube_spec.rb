require_relative './spec_helper'
require_relative '../day_10/ray_tube'

describe "RayTube" do 
  let(:rt) { RayTube.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_10_input.txt") }
  describe "solve_part_1" do 
    it "works for the example" do 
      expect(rt.solve_part_1).to eq(13140)
    end
  end

  describe "solve_part_2" do
    it "works for the example" do 
      expect(rt.solve_part_2).to eq(0)
    end 
  end
end