FactoryGirl.define do
  factory :user do
    username              { FFaker::Name.name }
    password              '123456'
    password_confirmation '123456'
    facebook_id           '123'
  end
end
