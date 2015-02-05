require 'spec_helper'
require 'rails_helper'

describe "Appearance" do
  let(:user) { User.create!(name: "Miriam", email: "miriam2@me.com", password: "password", password_confirmation: "password") }
  let(:game) { Game.create }
  let(:appearance) { Appearance.new }
  let(:valid_appearance) { game.appearances.create(player_id: user.id) }

  describe "#create" do
    it "creates a new Appearance object" do
      expect(appearance).to be_a Appearance
    end

    it "requires a player_id" do
      appearance.game_id = 1
      expect(appearance.valid?).to be_falsey
    end

    it "requires a game_id" do
      appearance.player_id = 1
      expect(appearance.valid?).to be_falsey
    end

    it "has a player" do
      expect(valid_appearance.player).to be_a User
    end

    it "has a game" do
      expect(valid_appearance.game).to be_a Game
    end

    it "defaults points to 0" do
      expect( appearance.points ).to eq 0
    end


  end
end