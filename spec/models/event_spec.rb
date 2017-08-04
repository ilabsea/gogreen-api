require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to have_table_name 'events' }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:facebook_link) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:user_id) }

  describe '#callback' do
    subject { create(:event, facebook_link: 'facebook.com') }

    it '#set_protocol' do
      expect(subject.facebook_link).to eq 'http://facebook.com'
    end
  end

  describe '.counter cache' do
    let!(:user) { create(:user) }
    let!(:event)  { create(:event, user: user) }

    it 'increases events_count by 1' do
      expect(user.reload.events_count).to eq 1
    end
  end
end
