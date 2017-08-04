require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_table_name 'users' }
  it { is_expected.to have_many(:pins) }
  it { is_expected.to have_many(:events) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to validate_presence_of(:facebook_id) }

  describe '.register_with_facebook_id' do
    it "return user" do
      user = User.register_with_facebook_id('facebook_id')
      expect(user.username).to eq('facebook_id')
      expect(user.facebook_id).to eq('facebook_id')
    end
  end
end
