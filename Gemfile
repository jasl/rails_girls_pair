source 'https://rubygems.org'

gem 'rails', '3.2.9'

gem 'devise'
gem 'devise_invitable'
gem 'cancan'
gem 'omniauth'
gem "omniauth-twitter"
gem "omniauth-weibo"

gem 'simple_form'

gem 'thin'

gem 'rails_admin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'bootstrap-sass'
  gem 'compass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'

  # friendly console
  gem 'pry'
  gem 'pry-rails'

  gem "hub", :require => nil, :group => [:development]

  gem 'letter_opener'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'awesome_print'
  gem 'factory_girl_rails'

  gem 'quiet_assets'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'email_spec'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end
