require_relative './spec_helper'
require_relative '../day_9/ropes'

describe "Ropes" do 
  let(:ropes) { Ropes.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_9_input.txt") }
  describe 'move_tail' do
    it "should take the coordinates and move the tail up" do 
      expect(ropes.move_tail_and_record([0, 2], [0, 0])).to eq([0, 1])
    end

    it "should take the coordinates and move the tail down" do 
      expect(ropes.move_tail_and_record([0, 2], [0, 4])).to eq([0, 3])
    end

    it "should take the coordinates and move the tail left" do 
      expect(ropes.move_tail_and_record([-2, 0], [0, 0])).to eq([-1, 0])
    end

    it "shoudl take the coordinates and move the tail right" do 
      expect(ropes.move_tail_and_record([2, 0], [0, 0])).to eq([1, 0])
    end

    it "should work on diagonal moves" do 
      expect(ropes.move_tail_and_record([2, 3], [1, 1])).to eq([2, 2])
    end

    it "should work on diagonal moves" do
      expect(ropes.move_tail_and_record([3, 2], [1, 1])).to eq([2, 2])
      expect(ropes.move_tail_and_record([3, 4], [4, 3])).to eq([3, 4])
    end

    it "should work on diagonal moves down" do 
      expect(ropes.move_tail_and_record([1, 1], [2, 3])).to eq([1, 2])
    end

    it "should work on diagonal moves down" do
      expect(ropes.move_tail_and_record([0, 0], [0, 0])).to eq([0, 0])
    end

    it "should working" do 
      expect(ropes.move_tail_and_record([1, 0], [0, 0])).to eq([0, 0])
    end

    it "should work" do 
      expect(ropes.move_tail_and_record([2, 0], [0, 0])).to eq([1, 0])
    end

    it "should work" do
      expect(ropes.move_tail_and_record([3, 0], [1, 0])).to eq([2, 0])
    end

    it "should work" do
      expect(ropes.move_tail_and_record([2, 2], [4, 3])).to eq([3, 2])
    end
  end

  describe "it should return the correct amount of moves for the example" do 
    it "should return 13 for the example" do 
      expect(ropes.solve_part_1).to eq(13)
    end
  end
end
