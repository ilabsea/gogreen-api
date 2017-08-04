FactoryGirl.define do
  factory :pin do
    latitude    { FFaker::Geolocation::lat }
    longitude   { FFaker::Geolocation::lng }
    icon        { 'happy' }
    marker_id   { '123' }
    user
  end
end
