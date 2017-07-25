require 'rails_helper'

RSpec.describe Api::V1::PhotosController, type: :controller do

  describe 'POST create' do
    let!(:pin){ create(:pin) }

    it 'creates pin photo' do
      post :create, params: { pin_id: pin.id,  photo: { name: fixture_file_upload('images/photo.jpeg', 'image/jpg') } }

      expect(pin.photos.count).to eq(1)
      expect(response).to have_http_status(201)
    end
  end

end
