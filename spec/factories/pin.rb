FactoryGirl.define do
  factory :pin do
    latitude    { FFaker::Geolocation::lat }
    longitude   { FFaker::Geolocation::lng }
    icon        { 'happy' }
    marker_id   { '123' }
    user

    trait :with_photos do
      transient do
        count 2
      end

      after(:create) do |pin, evaluator|
        evaluator.count.times.each do
          create(:photo, pin: pin)
        end
      end
    end
  end
end
