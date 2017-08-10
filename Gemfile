source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',                    '~> 5.0.1'
gem 'mysql2',                   '~> 0.3.18'
gem 'puma',                     '~> 3.0'
gem 'carrierwave',              '0.10.0'
gem 'carrierwave-base64'
gem 'fog'
gem 'sass-rails',               '~> 5.0'
gem 'uglifier',                 '>= 1.3.0'
gem 'coffee-rails',             '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder',                 '~> 2.5'
gem 'bcrypt',                   '~> 3.1.7'
gem 'bootstrap-sass',           '~> 3.3.6'
gem 'dotenv-rails',             '~> 2.2.1', groups: [:development, :test]
gem 'will_paginate-bootstrap'
gem 'active_model_serializers', '~> 0.10.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails',            '~> 3.5'
  gem 'ffaker',                 '~> 2.6.0'
  gem 'factory_girl_rails',     '~> 4.8.0'
  gem 'pry-rails',              '~> 0.3.6'
  gem 'pry-byebug',             '~> 3.4.2'
end

group :test do
  gem 'shoulda-matchers',       '~> 3.1.2', require: false
  gem 'database_cleaner',       '~> 1.6.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console',            '>= 3.3.0'
  gem 'listen',                 '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
  gem 'annotate',               '~> 2.7.2'
  gem 'capistrano',             '~> 3.6'
  gem 'capistrano-rails',       '~> 1.3'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
