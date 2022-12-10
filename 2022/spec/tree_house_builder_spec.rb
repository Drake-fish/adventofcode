require_relative './spec_helper'
require_relative '../day_8/tree_house_builder'

describe "TreeHouseBuilder" do 
    let(:tb) { TreeHouseBuilder.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_8_input.txt") }
    describe 'look_left' do
      it "should take a row of input and find any values to the left of the value" do 
        expect(tb.look_left([1, 2, 3, 5, 7], 2, 3)).to be true
      end
    end

    describe "look_right" do 
      it "should take a row of input and find any values to the right of the value" do 
        expect(tb.look_right([1, 2, 3, 5, 7], 2, 3)).to be false
      end
    end

    describe "look_all_ways" do
      it "should take a row of input and find any values to the left or right of the value" do 
        expect(tb.look_all_ways).to eq(21)
      end 
    end

    describe "look_up" do 
      it "should take the column of input and find any values above the value" do 
        expect(tb.look_up([3,2,6,3,3], 2, 6)).to be true
      end

      it "should take the column of input and find any values above the value" do
        expect(tb.look_up([3,2,6,3,3], 1, 2)).to be false
      end
    end

    describe "look_down" do 
      it "should take the column of input and find any values above the value" do 
        expect(tb.look_up([3,2,6,3,3], 2, 6)).to be true
      end

      it "should take the column of input and find any values above the value" do
        expect(tb.look_up([3,2,6,3,3], 1, 2)).to be false
      end
    end

    describe "look_left_complex" do
      it "should take a row of input and find any values to the left of the value" do 
        expect(tb.look_left_complex([1, 2, 3, 5, 7], 2, 3)).to eq(2)
      end

      it "should handle my special case" do
        expect(tb.look_left_complex([3, 3, 3, 5, 7], 2, 3)).to eq(1)
      end

      it "should return [] if its and edge tree" do 
        expect(tb.look_left_complex([3, 3, 3, 5, 7], 0, 3)).to eq(0)
      end
    end

    describe "look_right_complex" do
      it "should take a row of input and find any values to the right of the value" do 
        expect(tb.look_right_complex([1, 2, 3, 5, 7], 2, 3)).to eq(0)
      end

      it "should handle my special case" do
        expect(tb.look_right_complex([3, 3, 3, 3, 3], 2, 3)).to eq(1)
      end

      it "should return [] if its and edge tree" do 
        expect(tb.look_right_complex([3, 3, 3, 5, 7], 4, 7)).to eq(0)
      end

      it "should return all trees if it's good" do
        expect(tb.look_right_complex([3, 2, 1, 0, 0], 0, 3)).to eq(4) 
      end
    end

    describe "tree_scenic_score" do
      it "should return the correct response for the example" do 
        expect(tb.tree_scenic_scores).to eq(8)
      end
    end
  end