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
gem 'therubyracer', platforms: :ruby

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

# Use debugger
# gem 'debugger', group: [:development, :test]

gem "dotenv-rails", require: "dotenv/rails-now"
gem "slim" # templates
gem "kaminari"
gem "github-markdown"
gem "friendly_id", "~> 5.0.0"
gem "sucker_punch" # backgrounding
gem "premailer-rails" # style emails
gem "nokogiri"
gem "newrelic_rpm"
gem "globalize" # AR models translations
gem "simple_form"
gem "carrierwave" # uploads
gem "airbrake" # error reporting

# authentication
gem "omniauth-facebook"
gem "omniauth-twitter"

# decorators
gem "draper"
gem "decent_exposure", "~>2.3.0"
gem "decent_decoration"

# active record reputation system
gem "activerecord-reputation-system", github: "NARKOZ/activerecord-reputation-system", branch: "rails4"

# for mobile device detection
gem "mobile-fu"

# Procfile
gem "foreman"

group :test, :development do
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
  gem "terminal-notifier-guard"
  gem "rspec-rails"
  gem "annotate", :git => "git://github.com/ctran/annotate_models.git"
end

group :development do
  gem "rack-mini-profiler"
  gem "bullet"
  gem "better_errors"
  gem "binding_of_caller"
  gem "meta_request"
end

group :deployment do
  gem "capistrano"
  gem "capistrano-rails"
  gem "capistrano-passenger"
  gem "capistrano-rbenv"
  gem "capistrano-bundler"
  gem "capistrano-hipchat"
  gem "slackistrano"
end

group :test do
end

group :staging do
  gem "rails_12factor"
end
