require_relative './spec_helper'
require_relative '../day_2/rock_paper_sissors'

describe "RockPaperSissors" do 
    let(:rps) { RockPaperSissors.new("/Users/drakefish/Desktop/fun/adventofcode/2022/spec/day_2_input.txt") }
    describe 'is_win?' do
        it 'should return true if the combination is A and Y' do
            expect(rps.win?('A', 'Y')).to eq(true)
        end

        it "should return true if the combination is B and Z" do 
            expect(rps.win?('B', 'Z')).to eq(true)
        end

        it "should return true if the combination is C and X" do 
            expect(rps.win?('C', 'X')).to eq(true)
        end

        it "should return false if there is no winning combination" do 
            expect(rps.win?('A', 'Z')).to eq(false)
        end
    end

    describe "Draw?" do 
        it "should return true if the combinations are the same" do 
            expect(rps.draw?('A', 'X')).to eq(true)
        end

        it "should return false if the combinations are not the same" do
            expect(rps.draw?('A', 'Y')).to eq(false)
        end
    end

    describe "play_round" do 
        it "should return 7 if the first player wins" do 
            expect(rps.play_round('A', 'Y')).to eq(8)
        end

        it "should return 4 if the first player draws" do 
            expect(rps.play_round('A', 'X')).to eq(4)
        end

        it "should return 1 if the first player loses" do 
            expect(rps.play_round('A', 'Z')).to eq(3)
        end
    end

    describe "solve" do 
        it "should return the total from all the rounds" do 
            expect(rps.solve_part_1).to eq(25)
        end
    end

    describe "play_fixed_round" do
        it "should return 6 if the second player needs to lose" do 
            expect(rps.play_fixed_round('A', 'X')).to eq(3)
        end

        it "should return 4 if the second player needs to draw" do
            expect(rps.play_fixed_round('A', 'Y')).to eq(4)
        end

        it "should return 8 if the second player needs to win" do
            expect(rps.play_fixed_round('A', 'Z')).to eq(8)
        end
    end

    describe "solve_part_2" do 
        it "should return the total from all the rounds" do 
            expect(rps.solve_part_2).to eq(29)
        end
    end
end