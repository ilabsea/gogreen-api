require 'factory_girl'
require 'ffaker'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

def fixture_image_path(filename)
  "#{Rails.root}/spec/support/images/#{filename}"
end
