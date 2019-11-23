require './lib/calculator'
require 'spec_helper'


RSpec.describe Calculator do
    
    describe "#add" do
      it "returns the sum of two numbers" do
        calculator = Calculator.new
        expect(calculator.add(5, 2)).to eql(7)
      end
    end
    describe "#subtract" do
    it "returns the value of 2 subtracted numbers" do
        calculator = Calculator.new
        expect(calculator.subtract(6,3)).to eql(3)
    end
end
    describe "#multiply" do
    it "returns the value of 2 multiplied numbers" do
        calculator = Calculator.new
        expect(calculator.multiply(6,3)).to eql(18)
    end
end
    describe "#divide" do
    it "returns the value of 2 divided numbers" do
        calculator = Calculator.new
        expect(calculator.divide(6,3)).to eql(2)
    end
  end 
end 