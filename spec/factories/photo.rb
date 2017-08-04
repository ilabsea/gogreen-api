FactoryGirl.define do
  factory :photo do
    pin       { create(:pin) }
    status    'pending'
    reason    ''
    name      { Rack::Test::UploadedFile.new(fixture_image_path('event.jpeg')) }
    user
  end
end
