source 'https://rubygems.org'

ruby '2.0.0'

gem 'coffee-rails'
gem 'jquery-rails'
gem 'pg'
gem 'rails', '>= 4.0.0'
gem 'sass-rails'
gem 'slim-rails'
gem 'unicorn'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
  gem 'rack-livereload'
  gem 'guard', '>= 2.2'
  gem 'guard-livereload', '>= 2.0'
end

group :development, :test do
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'rails_12factor'
end
