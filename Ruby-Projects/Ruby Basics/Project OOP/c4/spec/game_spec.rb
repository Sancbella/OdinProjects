require './lib/game.rb'
RSpec.describe Game do
  before do
      IO.any_instance.stub(:puts)
      
  end
  describe "#won?" do
  end
  describe "#tie?" do
  end
  describe "#overlap?" do
  end
end