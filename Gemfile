source "https://rubygems.org"

gemspec

gem 'refinerycms', '~> 4.0.2'
gem 'refinerycms-wymeditor', ['~> 2.0', '>= 2.0.0']
gem 'refinerycms-authentication-devise', '~> 2.0'
gem 'refinerycms-acts-as-indexed', ['~> 3.0', '>= 3.0.0']

platforms :ruby do
  gem 'sqlite3'
end

group :development, :test do
  gem 'refinerycms-testing'
  gem 'factory_girl_rails', '~> 4.9.0'
  gem 'rspec-its' # for the model's validation tests.
  gem 'spring'
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver', '~> 3.142.7'
  gem 'capybara-webkit', '~> 1.15.1'
  gem 'capybara-screenshot', '~> 1.0.24'
  gem 'simplecov', '~> 0.18.2'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  platforms :ruby do
    require 'rbconfig'
    if RbConfig::CONFIG['target_os'] =~ /linux/i
      gem 'therubyracer', '~> 0.12.3'
    end
  end
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

