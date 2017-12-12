require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject { Dessert.new('ice cream', 3, chef) }

  describe "#initialize" do
    it "sets a type" do 
      expect(subject.type).to eq('ice cream')
    end

    it "sets a quantity" do 
      expect(subject.quantity).to eq(3)
    end

    it "starts ingredients as an empty array" do 
      expect(subject.ingredients).to eq([])
    end 

    it "raises an argument error when given a non-integer quantity" do 
      expect do 
        Dessert.new('ice cream', 'e', :chef)
      end.to raise_error(ArgumentError)
      
    end 
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      subject.add_ingredient('pepper')
      expect(subject.ingredients.length).to eq(1)
    end 
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      subject.add_ingredient('pepper')
      subject.add_ingredient('corn')
      subject.add_ingredient('flakes')
      expect(subject.mix!).to_not eq(subject.ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      subject.eat(1)
      expect(subject.quantity).to eq(2)
    end 

    it "raises an error if the amount is greater than the quantity" do 
      expect do 
        subject.eat(5)
      end.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      allow(chef).to receive(:titleize).and_return('Bruce Wong')
      expect(subject.serve).to match(/Bruce Wong/)
      
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      allow(chef).to receive(:bake)
      expect(chef).to receive(:bake).with(subject)
      subject.make_more 
    end
  end
end
