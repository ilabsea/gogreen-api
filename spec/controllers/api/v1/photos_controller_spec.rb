require 'rails_helper'

RSpec.describe Api::V1::PhotosController, type: :controller do
  describe 'POST create' do
    let(:user)         { create(:user) }
    let(:pin)          { create(:pin, :with_photos, user: user) }

    let(:valid_params) do
      { pin_id: pin.id,  photo: { pin_id: pin.id, name: fixture_file_upload('images/photo.jpeg', 'image/jpg'), user_id: user.id } }
    end

    let(:invalid_params) do
      { pin_id: pin.id,  photo: { pin_id: pin.id, user_id: user.id, status: 'incorrect' } }
    end

    it '#GET index' do
      get :index, params: { pin_id: pin.id }

      expect(JSON.parse(response.body).length).to eq 2
    end

    it '#POST creates success' do
      post :create, params: valid_params

      expect(response).to have_http_status(201)
    end

    it '#POST creates fails' do
      post :create, params: invalid_params

      expect(response).to have_http_status(422)
    end
  end
end
