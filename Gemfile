source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'as_json_representations'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'rack-cors'
gem 'validates_timeliness', '~> 4.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
