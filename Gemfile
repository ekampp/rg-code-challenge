# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

group :test, :development do
  gem "bundler-audit"
  gem "guard"
  gem "rspec"
  gem "rubocop"
  gem "rubocop-rspec"
end

group :test do
  gem "guard-rspec"
  gem "rspec-its"
  gem "simplecov"
end
