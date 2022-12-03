require_relative './spec_helper'
require_relative '../day_3/rucksack_fixer'

describe "RuckSackFixer" do 
    let(:rsf) { RuckSackFixer.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_3_input.txt") }
    describe 'split_input' do
      it "should take the input string and split it directly in half and return 2 arrays " do 
        expect(rsf.split_input("abcdefgh")).to eq([["a","b", "c", "d"], ["e", "f", "g", "h"]])
      end
    end

    describe "matching_letters" do 
      it "returns the matching letter in the sets of arrays" do
        expect(rsf.matching_letters([["a","b", "c", "d"], ["e", "f", "c", "h"]])).to eq(["c"])
      end

      it "returns case sensitive matches only" do
        expect(rsf.matching_letters([["a","B", "c", "d"], ["a", "b", "C", "h"]])).to eq(["a"])
      end
    end

    describe "get_letters_index" do
      it "returns 5 for the letter e" do 
        expect(rsf.get_letters_index("e")).to eq(5)
      end

      it "returns 5 for the uppercase letter E" do 
        expect(rsf.get_letters_index("E")).to eq(5)
      end
    end

    describe "get_letter_value" do
      it "returns 5 for the letter e" do 
        expect(rsf.get_letter_value("e", 5)).to eq(5)
      end

      it "returns 31 for the uppercase letter E" do 
        expect(rsf.get_letter_value("E", 5)).to eq(31)
      end
    end

    describe "solve_part_1" do
      it "returns the correct answer for the test input" do
        expect(rsf.solve_part_1).to eq(262)
      end
    end

    describe "groups_of_3" do 
      it "returns the input split into groups of 3" do 
        expect(rsf.groups_of_3).to eq([["dWlhclDHdFvDCCDfFq", "mGdZBZBwRGjZMFgvTvgtvv", "jwwJrzdzGdSbGGnNlzWczHzPHPhn"],
        ["cczcbMBszhzzDBTBPPPGjtvtlt", "LqJLfpwdLnvQLRGQjGtj", "gSgnSJJCGSGpGSrwgfhchmmmHzcrHDmbrmMm"],
        ["bVjstCsSstCLCrbSLnMpdMndcLddcqcpHR", "wPZJQJwtBfJZmgBwPTcpTdcnfHMppcGMdG", "gmFJzwPJJtszvNhCNC"]])
      end
    end

    describe "matching_input" do 
      it "returns the matching letter between the 3 arrays" do 
        expect(rsf.matching_input(["abc", "aef", "ahi"])).to eq(["a"])
      end

      it "returns the matching uppercase between 3 arrays" do 
        expect(rsf.matching_input(["AHc", "aeH", "aHi"])).to eq(["H"])
      end
    end

    describe "solve_part_2" do 
      it "returns the correct value for the test input" do 
        expect(rsf.solve_part_2).to eq(57)
      end
    end
  end