require 'spec_helper'
require 'rails_helper'

describe UsersController do
  let!(:miriam) {User.create!(name: "Miriam", email: "mm@me.com", password: "password", password_confirmation: "password")}

  describe 'GET #new' do
    before { get :new }

    it 'renders successfully' do
      expect(response).to be_success
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:nicole_data) do
      {name: "nicole", email: "nicole@me.com", password: "password", password_confirmation: "password"}
    end

    before { post :create, user: nicole_data }

    it 'allows user to sign up' do
      expect(response).to redirect_to user_path(User.last)
      expect(controller.current_user).to eq(User.last)
    end
  end

  describe 'GET #edit' do
    before { get :edit, id: miriam.id }

    it 'renders successfully' do
      expect(response).to be_success
    end

    it 'renders edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH#update' do
    before { patch :update, user: {email: "miriam@me.com"}, id: miriam.id}

    it "will direct user to show page" do
      expect(response).to redirect_to miriam
    end

  end

  describe 'GET#show' do
    before { get :show, id: miriam.id }

    it 'renders show template' do
      expect(response).to render_template(:show)
    end
  end

end
