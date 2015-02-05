require 'spec_helper'
require 'rails_helper'

describe "Game" do
  let(:game) { Game.create }

  describe "#create" do
    it "creates a new game object" do
      expect(game).to be_a Game
    end

    it "has rounds" do
      expect(game.rounds).to eq Round.where(game_id: game.id)
    end

    it "has appearances" do
      expect(game.appearances).to eq Appearance.where(game_id: game.id)
    end

    it "creates a new round when a game is created" do
      expect(game.rounds.length).to eq 1
    end
  end
end