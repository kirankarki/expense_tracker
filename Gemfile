source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1', '>= 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.10'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Authentication & Authorization
gem 'devise', '~> 4.2', '>= 4.2.1'

# UI
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'bootstrap-datepicker-rails', '~> 1.6', '>= 1.6.4.1'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'

gem 'colorize', '~> 0.8.1'

# Pagination
gem 'bootstrap-will_paginate', '~> 1.0'

# Data Visualization
gem 'chartkick', '~> 2.2', '>= 2.2.4'
gem 'groupdate', '~> 3.2'

# Search
gem 'searchkick', '~> 2.3', '>= 2.3.1'

# Background Jobs
gem 'sidekiq', '~> 5.0', '>= 5.0.4'

# Exception Tracker
gem 'rollbar', '~> 2.15'

# Social logins
gem 'omniauth-twitter', '~> 1.4'
gem 'omniauth-facebook', '~> 4.0'
gem 'omniauth-google-oauth2', '~> 0.5.2'

# Store session in DB
gem 'activerecord-session_store', '~> 1.1'

# Hack the app's boot time
gem 'bootsnap', '~> 1.1', '>= 1.1.3', require: false

# Admin dashboard
gem 'activeadmin', '~> 1.1'

# File upload
gem 'shrine', '~> 2.8'
gem 'fastimage', '~> 2.1'
gem 'image_processing', '~> 0.4.5'
gem 'mini_magick', '~> 4.8'

# Haml for template engine
gem 'haml-rails', '~> 1.0'

group :development, :test do
  # Debugging & Errors
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  gem 'binding_of_caller'

  # Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.
  gem 'annotate', '~> 2.7', '>= 2.7.1'

  # Code styles
  gem 'rubocop', '~> 0.49.1', require: false

  # Generate ERD
  gem 'rails-erd', '~> 1.5', '>= 1.5.2'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
