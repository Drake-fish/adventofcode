require_relative './spec_helper'
require_relative '../day_6/tuner'

describe "Tuner" do 
  let(:tuner) { Tuner.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_6_input.txt") }
  let(:tuner_2) { Tuner.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_6_input_2.txt") }
  let(:tuner_3) { Tuner.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_6_input_3.txt") }
  let(:tuner_4) { Tuner.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_6_input_4.txt") }
  describe "all_uniq?" do 
    it "should look at the previous 3 characters and see if any match" do 
      expect(tuner.all_uniq?("abcd")).to be true
    end

    it "should return false if there is a matching character" do 
      expect(tuner.all_uniq?("abca")).to be false
    end
  end

  describe "solve_part_1" do
    it "should return the correct output for part 1" do 
      expect(tuner.solve_part_1).to eq(5)
    end

    it "should return the correct output for part 1" do 
      expect(tuner_2.solve_part_1).to eq(6)
    end

    it "should return the correct output for part 1" do 
      expect(tuner_3.solve_part_1).to eq(10)
    end

    it "should return the correct output for part 1" do
      expect(tuner_4.solve_part_1).to eq(11)
    end
  end

  describe "solve_part_2" do 
    it "should return the correct output for part 2" do 
      expect(tuner.solve_part_2).to eq(23)
    end

    it "should return the correct output for part 2" do 
      expect(tuner_2.solve_part_2).to eq(23)
    end

    it "should return the correct output for part 2" do 
      expect(tuner_3.solve_part_2).to eq(29)
    end

    it "should return the correct output for part 2" do 
      expect(tuner_4.solve_part_2).to eq(26)
    end
  end
end
