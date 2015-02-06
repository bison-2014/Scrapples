require 'spec_helper'
require 'rails_helper'

describe "Card" do 
  let(:name) { "Jim Bob" }
  let(:bio) { 'One huge text blob that will go through a whole history of the person on the card' }
  let(:card) { Card.create(name: name, bio: bio) }
  
  context '#create' do
    it 'creates a Card object' do
      expect(card).to be_a Card
    end
    
    it 'requires two parameters' do
      expect { Card.create! }.to raise_error
    end
  end
      
  describe '#name' do 
    it 'has a name attribute' do 
      expect(card).to respond_to(:name)
    end
    
    it 'has a name as a string' do 
      expect(card.name).to be_a String
    end
  end
  
  describe '#bio' do
    it 'has a bio attribute' do
      expect(card).to respond_to(:bio)
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
  
  describe '#updated_at' do
    it 'has an updated_at attribute' do 
      expect(card).to respond_to(:updated_at)
    end
  end
end