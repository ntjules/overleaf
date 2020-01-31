source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "rails", "~> 6.0.0"
gem "pg"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "aasm", "~> 4.12" #  for state management
gem "ransack"   #  for sorting & serching
# gem "will_paginate" #  for pagination
gem "kaminari" #  for pagination
gem "bootstrap4-kaminari-views"
gem "bcrypt", "3.1.13"
gem "acts-as-taggable-on", "~> 6.0"

gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "spring"
  gem "rspec-rails"
  gem "spring-commands-rspec"
  gem "factory_bot_rails"
  gem "faker"
  gem "capybara", "~> 3.29"
  gem "database_cleaner"
  gem "launchy"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "database_cleaner"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
