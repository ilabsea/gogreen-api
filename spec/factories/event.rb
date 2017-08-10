FactoryGirl.define do
  factory :event do
    title          { FFaker::Name.name }
    description    { FFaker::Lorem.paragraphs(1 + Kernel.rand(5)).join("\n") }
    facebook_link  { 'facebook.com' }
    location       { 'Kandal' }
    date           { Time.zone.today }
    start_time     { Time.zone.now }
    end_time       { start_time + 3.hour }
    image          { Rack::Test::UploadedFile.new(fixture_image_path('event.jpeg')) }
    user
  end
end
