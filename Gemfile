source 'https://rubygems.org'

gem 'rails'

gem 'bootsnap', require: false
gem 'bootstrap'
gem 'dartsass-rails'
# Rails8にdevise gemのtest_helpersが対応していないためmainブランチを指定
gem 'devise', git: 'https://github.com/heartcombo/devise', branch: 'main'
gem 'haml-rails'
gem 'importmap-rails'
gem 'kamal', require: false
gem 'propshaft'
gem 'puma'
gem 'simple_form'
gem 'sqlite3'
gem 'stimulus-rails'
gem 'thruster', require: false
gem 'turbo-rails'

group :development, :test do
  gem 'brakeman', require: false
  gem 'factory_bot_rails'
  gem 'haml-lint'
  gem 'rspec-rails'
  gem 'sgcop', github: 'SonicGarden/sgcop', branch: 'main'
end

group :development do
  gem 'bullet'
  gem 'letter_opener_web'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'email_spec'
  gem 'selenium-webdriver'
end
