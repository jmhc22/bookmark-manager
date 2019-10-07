# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

ruby '2.6.3'

gem 'rake'
gem 'sinatra'

group :test do
  gem 'rspec'
  gem 'rubocop'
  gem 'simplecov'
  gem 'capybara'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'rubocop-rails'
end
