require 'rails_helper'

RSpec.describe Pin, type: :model do
  it { is_expected.to have_table_name 'pins' }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:photos) }
  it { is_expected.to validate_presence_of(:latitude) }
  it { is_expected.to validate_presence_of(:longitude) }
  it { is_expected.to validate_presence_of(:icon) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:marker_id) }
  it { is_expected.to validate_inclusion_of(:icon).in_array(%w(happy sad trash)) }

  describe '.counter cache' do
    let!(:user) { create(:user) }
    let!(:pin)  { create(:pin, user: user) }

    it 'increases pins_count by 1' do
      expect(user.reload.pins_count).to eq 1
    end
  end
end
