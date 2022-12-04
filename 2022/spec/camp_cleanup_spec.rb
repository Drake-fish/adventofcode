require_relative './spec_helper'
require_relative '../day_4/camp_cleanup'

describe "CampCleanup" do 
    let(:camp_clean) { CampCleanup.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_4_input.txt") }

    describe "compare_inputs" do
      it "should return true if the first range full contains the second range" do 
        expect(camp_clean.compare_inputs((2..8), (3..7))).to eq(true)
      end

      it "should return false if the first range does not fully contain the second range" do 
        expect(camp_clean.compare_inputs((2..8), (3..9))).to eq(false)
      end

      it "should return true if the second range full contains the first range" do
        expect(camp_clean.compare_inputs((6..6), (2..8))).to eq(true)
      end
    end

    describe "compare_inputs_flexible" do 
      it "should return true if the first range contains any of the second range" do 
        expect(compare_inputs_flexible((2..8), (8..12))).to eq(true)
      end

      it "should return false if the ranges do not overlap at all" do 
        expect(compare_inputs_flexible((2..8), (9..12))).to eq(false)
      end
    end

    describe "change_input_to_range" do 
      it "should change the input from a string to a range" do
        expect(camp_clean.change_input_to_range("2-8,3-7")).to eq([(2..8), (3..7)])
      end
    end

    describe "solve_part_1" do 
      it "should return the number of ranges that fully contain another range" do 
        expect(camp_clean.solve_part_1).to eq(2)
      end
    end
end