require './lib/game.rb'
require './lib/player.rb'

# https://stackoverflow.com/questions/16005281/rspec-how-to-assign-instance-variable-in-controller-spec

RSpec.describe Game do
    before do
        IO.any_instance.stub(:puts)
        
    end
    describe "#won?" do
        it "Top xxx is win" do
            win_combo = [0,1,2]
            expect(subject.won?(win_combo, win_combo)).to eql(true)
        end
        it "mid xxx is win" do
            win_combo = [3,4,5]
            expect(subject.won?(win_combo, win_combo)).to eql(true)
        end
        it "bottom xxx is win" do
            win_combo = [8,7,6]
            expect(subject.won?(win_combo, win_combo)).to eql(true)
        end
        it "diagonal l to r xxx is win" do
            win_combo = [0,4,8]
            expect(subject.won?(win_combo, win_combo)).to eql(true)
        end
        it "diagonal r to l xxx is win" do
            win_combo = [2,4,6]
            expect(subject.won?(win_combo, win_combo)).to eql(true)
        end
        it "vert l xxx is win" do
            win_combo = [0,3,6]
            expect(subject.won?(win_combo,win_combo)).to eql(true)
        end
        it "vert m xxx is win" do
            win_combo = [1,4,7]
            expect(subject.won?(win_combo,win_combo)).to eql(true)
        end
        it "vert r is win" do
            win_combo = [2,5,8]
            expect(subject.won?(win_combo,win_combo)).to eql(true)
        end
    end
end