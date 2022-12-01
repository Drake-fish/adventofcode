require 'spec_helper'
require_relative '../day_1/day1'

describe "Day 1" do 
    describe 'summed_caloric_elves' do
    it 'should return an array of the sum of the blocks' do
        expect(summed_caloric_elves("/Users/drakefish/Desktop/fun/adventofcode/spec/day_1_input.txt")).to eq([103, 800, 10, 1, 164])
    end
    end

    describe "top_caloric_elf" do
        it 'should return the top caloric elf' do
            elves = [103, 800, 10, 1, 164]
            expect(top_caloric_elf(elves)).to eq(800)
        end
    end

    describe "top_3_caloric_elfs_total" do
        it "should return the total of the top 3 caloric elves" do 
            elves = [103, 800, 10, 1, 164]
            expect(top_3_caloric_elfs_total(elves)).to eq(1067)
        end
    end
end