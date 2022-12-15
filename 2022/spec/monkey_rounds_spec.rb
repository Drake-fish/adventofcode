require_relative './spec_helper'
require_relative '../day_11/rounds'

describe "Rounds" do 
  let(:rounds) { Rounds.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_11_input.txt") }
  describe "solve_part_1" do 
    it "works for the example" do 
      expect(rounds.solve_part_1).to eq(10605)
    end
  end

  describe "solve_part_2" do 
    it "works for the example" do 
      expect(rounds.solve_part_2).to eq(10197)
    end
  end
end