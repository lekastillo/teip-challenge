source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.0.4'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem 'jbuilder'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem 'kredis'

#adding jwt gem for token access
gem 'jwt', '2.6.0'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '3.1.18'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
  gem 'rswag'
  gem 'rswag-specs'
  gem 'capybara'
  gem 'minitest-line'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
  gem 'annotate'
  gem 'awesome_print', require: 'ap'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'dotenv-rails', require: 'dotenv/rails-now'
  gem 'faker'
  gem 'listen', '~> 3.3'
  gem 'pry-byebug'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 4.1.0'
end

gem 'nokogiri', force_ruby_platform: true
gem 'paranoia', '2.6.1'

gem 'dry-validation'

gem 'trailblazer-rails', '2.4.3'
gem 'trailblazer-loader', '0.1.2'
# gem 'reform-rails'
gem 'roar-jsonapi', '0.0.3'
gem 'multi_json'
gem 'kaminari'

gem 'rswag-api'
gem 'rswag-ui'