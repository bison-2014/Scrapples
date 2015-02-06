require 'spec_helper'
require 'rails_helper'

describe User do
	let(:user) {
    User.create(name: "Lele", email: "lele@me.com", password: "password", password_confirmation: "password")
  }

	describe "validates attributes" do
		it "is valid with name, email and password" do
			expect(user).to be_valid
		end
	end

end
