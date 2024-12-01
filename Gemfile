source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'mongo'
# Remove 'bson_ext' as it's deprecated and merged into 'mongo' gem
# gem 'bson_ext'

gem 'rails', '~> 6.1.0'
gem 'rspec-rails', '~> 5.0' # Update for Rails 6 compatibility
gem 'jquery-rails'

# Use Puma 5.x for compatibility with Rails 6 and Ruby 3
gem 'puma', '~> 5.0'

# Replace 'sass-rails' with 'sassc-rails' as 'sass-rails' is deprecated
gem 'sassc-rails', '>= 2.1.0'

gem 'uglifier', '>= 4.2.0' # Ensure it's compatible with ES6 if needed

# Consider removing 'coffee-rails' if not using CoffeeScript
# gem 'coffee-rails', '~> 5.0'

gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.11' # Update to the latest version

gem 'bootsnap', '>= 1.7.0', require: false # Update for Ruby 3 compatibility

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.0' # Ensure it's in the right group
end

group :development do
  gem 'web-console', '>= 4.1.0' # Update for Rails 6
  gem 'listen', '~> 3.3' # Update for compatibility
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.1'
end
gem 'coffee-rails', '~> 5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
