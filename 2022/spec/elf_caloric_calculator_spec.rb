require_relative './spec_helper'
require_relative '../day_1/elf_caloric_calculator'

describe "ElfCaloricCalculator" do 
    let(:elf_calc) { ElfCaloricCalculator.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_1_input.txt") }
    describe 'summed_caloric_elves' do
    it 'should return an array of the sum of the blocks' do
        expect(elf_calc.summmed_caloric_elves).to eq([103, 800, 10, 1, 164])
    end
    end

    describe "top_caloric_elf" do
        it 'should return the top caloric elf' do
            expect(elf_calc.top_caloric_elf).to eq(800)
        end
    end

    describe "top_3_caloric_elfs_total" do
        it "should return the total of the top 3 caloric elves" do 
            expect(elf_calc.top_3_caloric_elfs_total).to eq(1067)
        end
    end
end