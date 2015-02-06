require 'spec_helper'
require 'rails_helper'

Describe "Card" do 
  let(:name) { "Jim Bob" }
  let(:bio) { 'One huge text blob that will go through a whole history of the person on the card' }
  let(:card) { Card.new(name, bio)}
  
  context '#initialize' do
    it 'creates a Card object' do
      expect(card).to be_a Card
    end
    
    it 'requires two parameters' do
      expect { Card.new }.to raise_error(ArgumentError)
    end
    
    it "initializes with a created_at timestamp" do 
      expect(task.created_at).to be_a DateTime
    end
  end
      
  describe '#title' do 
    it 'has a title attribute' do 
      expect(card).to respond_to(:title)
    end
    
    it 'has a title as a string' do 
      expect(card.title).to be_a String
    end
  end
  
  describe '#bio' do
    it 'has a bio attribute' do
      expect.card.to respond_to(:bio)
    end
    
    it 'has a bio as a large text block' do 
      expect(card.bio).to be_a String
    end
  end
  
  describe '#created_at' do
    it 'has a created_at attribute' do 
      expect(card).to respond_to(:created_at)
    end
  end
  
  descirbe '#updated_at' do
    it 'has an updated_at attribute' do 
      expect(card).to respond_to(:updated_at)
    end
  end
end