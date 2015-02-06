require 'spec_helper'
require 'rails_helper'

describe SessionsController do
	let!(:miriam) {User.create!(name: "Miriam", email: "mm@me.com", password: "password", password_confirmation: "password")}

	describe "POST#create" do
		before { post :create, session: {email: miriam.email, password: miriam.password}  }
 
    it "successfully starts a session" do
      expect(response).to redirect_to miriam
    end
  end

  describe "DELETE#destroy" do
  	before { delete :destroy, session: {id: miriam.id} }

  	it "deletes a session" do
  		expect(response).to redirect_to login_path
  	end
  end

end


