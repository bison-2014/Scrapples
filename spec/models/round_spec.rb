require 'spec_helper'
require 'rails_helper'

describe "Round" do
  before(:all) do
    'rake db:yolo'
  end

  let(:game) { Game.create }
  let(:round) { Round.create(game_id: game.id) }

  describe "#computer_draws_card" do
    # let(:card) { }

    it "generates a card for the computer" do
      Card.create(name: "name", bio: "bio")
      expect(round.computer_draws_card).to be_an_instance_of(Card)
    end

    it "generates an unplayed card" do
      # played = Card.create(name: "played", bio: "bio")
      # unplayed = Card.create(name: "unplayed", bio: "bio")

      # allow(game).to receive(:drawn_cards) { [played] }
      # expect(round.computer_draws_card).to eq(unplayed)
    end
  end
end