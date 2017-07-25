require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.register_with_facebook_id' do
    it "return user" do
      user = User.register_with_facebook_id('facebook_id')
      expect(user.username).to eq('facebook_id')
      expect(user.facebook_id).to eq('facebook_id')
    end
  end
end
