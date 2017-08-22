require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { is_expected.to have_table_name 'photos' }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:pin) }
  it { is_expected.to validate_presence_of(:pin_id) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_inclusion_of(:status).in_array(%w(pending approved rejected)) }

  describe '#callback' do
    subject { create(:photo, status: nil) }

    it '#set_status' do
      expect(subject.status).to eq 'pending'
    end
  end

  context 'if status rejected' do
    before { allow(subject).to receive(:rejected_status?).and_return(true) }

    it { is_expected.to validate_presence_of(:reason) }
  end

  context 'if status besides rejected' do
    before { allow(subject).to receive(:rejected_status?).and_return(false) }

    it { is_expected.not_to validate_presence_of(:reason) }
  end
end
