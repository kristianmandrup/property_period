source "http://rubygems.org"

ruby '2.0.0'

gem "rails",      '~> 4.0.0.beta1', github: 'rails/rails'
gem 'mongoid',    '>= 4',           github: 'mongoid/mongoid'

# Declare your gem's dependencies in property_period.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

gem "rspec-rails", :group => [:test, :development]

group :test do  
  gem 'spork'

  # time travel
  gem 'delorean',   '>= 1.1'

  gem 'cutter',     '>= 0.8.2'

  # data store
  gem 'database_cleaner',   '>= 0.8'

  # Fake data
  gem 'ffaker', '>= 1.14.1'
  gem 'fakeweb'

  gem 'shoulda'         
  gem 'shoulda-matchers'

  gem 'factory_girl_rails', :require => false
end
