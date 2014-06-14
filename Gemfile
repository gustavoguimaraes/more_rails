source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.0.3'
gem 'turbolinks'
gem 'pg'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer'
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'jbuilder', '~> 1.2' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'dalli'
gem 'bootstrap-sass'
gem 'sass-rails', '~> 4.0.0' # Use SCSS for stylesheets
gem 'devise'
# gem 'omniauth'
# gem 'omniauth-google-oauth2'
gem 'activeadmin', github: 'gregbell/active_admin'

# gem 'aws-sdk'
# gem 'paperclip?'

# gem 'unicorn', require: false # Use unicorn as the app server

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'growl'
  gem "guard"
  gem "guard-rspec"
  gem "foreman"
end

group :development, :test  do
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller' # Gives better_errors more functionality

  gem 'figaro'
  gem "rspec-rails", "~> 2.14"
  gem "factory_girl_rails", "~> 4.2"
  gem 'fuubar'
  gem 'rake'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'pry'
end

# Heroku
group :production do
  gem 'rails_12factor'
  gem 'memcachier'
end
