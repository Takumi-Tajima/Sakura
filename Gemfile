source 'https://rubygems.org'

gem 'rails'

gem 'bootstrap'
gem 'dartsass-rails'
# Rails8にdevise gemのtest_helpersが対応していないためmainブランチを指定
gem 'active_storage_validations'
gem 'acts_as_list'
gem 'devise', git: 'https://github.com/heartcombo/devise', branch: 'main'
gem 'haml-rails'
gem 'image_processing'
gem 'importmap-rails'
gem 'propshaft'
gem 'puma'
gem 'simple_form'
gem 'sqlite3'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'bootsnap', require: false

gem 'kamal', require: false

gem 'thruster', require: false

group :development, :test do
  gem 'brakeman', require: false
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'haml-lint'
  gem 'rspec-rails'
  gem 'sgcop', github: 'SonicGarden/sgcop', branch: 'main'
end

group :development do
  gem 'bullet'
  gem 'html2haml'
  gem 'letter_opener_web'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'email_spec'
  gem 'selenium-webdriver'
end
