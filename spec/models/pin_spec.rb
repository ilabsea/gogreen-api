require 'rails_helper'

RSpec.describe Pin, type: :model do
	it { should belong_to(:user) }
end
