require 'rails_helper'

describe UsersController do

  describe 'GET #new' do
    it 'renders successfully' do
      get :new
      expect(response).to be_success
    end

    it 'renders the new page' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
      let(:user) do
      {name: "nicole", email: "nicole@me.com", password: "password", password_confirmation: "password"}
    end

    it 'allows user to sign up' do
      post :create, user: user

      expect(response).to redirect_to user_path(User.last)
      expect(controller.current_user).to eq User.last
    end
  end

  describe 'GET #edit' do
    it 'renders successfully' do
      user = users(:dicko)
      get edit_user_path(user)
       assert_template 'users/edit'
    patch user_path(@user), user: { name:  "Dicko",
                                    email: "foo@invalid.com",
                                    password: "foo",
                                    password_confirmation: "foo" }
    assert_template 'users/edit'
    end

  end

end
 
