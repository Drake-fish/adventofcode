require_relative './spec_helper'
require_relative '../day_5/supply_stack'

describe "SupplyStack" do 
  let(:crates) { [["NZ", "DCM", "P"]] }
  let(:complicated_crates) { [["DTWNL","HCP","JMGDNHPW","LQTNSWC","NCHP","BQWMDNHT","LSGJRBM","TRBVGWNZ","LPNDGW"]] }
  let(:st) { SupplyStack.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_5_input.txt", crates) }
  let(:st_2) { SupplyStack.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_5_part_2_input.txt", complicated_crates) }
  describe "read_instructions" do 
    it "should break the instructions into variables to use" do 
      expect(st.read_instructions("move 6 from 6 to 5")).to eq([6, 6, 5])
    end

    it "should handle numbers over 10" do
      expect(st.read_instructions("move 12 from 12 to 11")).to eq([12, 12, 11]) 
    end
  end

  describe "move" do 
    it "should take an array of instructions and move the crates" do 
      expect(st.move([1,2,1], 9000)).to eq([["DNZ", "CM", "P"]])
    end

    it "should take an array of instructions and move the crates" do 
      expect(st.move([1,2,1], 9001)).to eq([["DNZ", "CM", "P"]])
    end

    it "should move the crates at the same time" do 
      expect(st.move([2,1,3], 9001)).to eq([["", "DCM", "NZP"]])
    end

    it "should move the crates at the same time" do 
      expect(st.move([3,2,1], 9001)).to eq([["DCMNZ", "", "P"]])
    end

    it "should do nothing if there's no crates to move" do 
      expect(st.move([18,3,1], 9001)).to eq([["PNZ", "DCM", ""]])
    end
  end

  describe "get_top_letters" do 
    it "should return the top letter of each stack" do 
      expect(st.get_top_letters).to eq("NDP")
    end
  end

  describe "solve_part_1" do 
    it "should return the correct output for part 1" do 
      expect(st.solve_part_1).to eq("CMZ")
    end
  end

  describe "solve_part_2" do 
    it "should return the correct output for part 2" do 
      expect(st.solve_part_2).to eq("MCD")
    end

    it "should return the correct output for part 2 with more complicated instructions" do 
      expect(st_2.solve_part_2).to eq("LNJWTHLG")
    end
  end
end
