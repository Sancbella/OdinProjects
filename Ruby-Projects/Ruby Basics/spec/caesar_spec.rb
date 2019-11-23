require './lib/caesar.rb'

RSpec.describe Caesar do
    describe "#encrypt" do
        cypher = Caesar.new
        it "encrypts multiple words" do
            expect(cypher.cipher('Hells yea', 5)).to eql('Mjqqx djf')
        end
        it "encrypts one word" do
            expect(cypher.cipher('Hells', 5)).to eql('Mjqqx')
        end
        it "encrypts over the deviation of 26" do
            expect(cypher.cipher('Hells yea', 30)).to eql('Lippw cie')
        end
        it "encrypts multiple words" do
            expect(cypher.cipher('Hells yea', 5)).to eql('Mjqqx djf')
        end
        it "does negative encryption numbers" do
            expect(cypher.cipher('Hells yea', -5)).to eql('Czggn tzv') #This doesn't work
        end
    end
end