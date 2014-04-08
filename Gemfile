ruby "2.0.0"

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

gem "airbrake_user_attributes"

# Use unicorn as the app server
gem "unicorn"

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem "dotenv-rails"

gem "slim"
gem "kaminari"

gem "omniauth-facebook"
gem "omniauth-twitter"

# annotate models
gem "annotate", :git => "git://github.com/ctran/annotate_models.git"

# uploads
gem "carrierwave"

# simple forms
gem "simple_form"

# decorators
gem "draper"
gem "decent_exposure", "~>2.3.0"
gem "decent_decoration"

# github markdown
gem "github-markdown"

group :test, :development do
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
  gem "terminal-notifier-guard"
  gem "rspec-rails"
end

group :development do
  gem "rack-mini-profiler"
  gem "bullet"
  gem "better_errors"
  gem "binding_of_caller"
  gem "meta_request"
end

group :test do
end

group :production do
  gem "rails_12factor"
end

# active record reputation system
gem "activerecord-reputation-system", github: "NARKOZ/activerecord-reputation-system", branch: "rails4"

# friendly id
gem "friendly_id", "~> 5.0.0"
