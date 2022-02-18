# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

group :test, :development do
  gem "rspec"
  gem "guard"
end

group :test do
  gem "rspec-its"
  gem "guard-rspec"
end
