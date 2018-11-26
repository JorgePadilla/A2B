source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.5.1'
gem 'rails', '~> 5.1.6'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
#  gem 'spring'
#  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'administrate'
gem 'bootstrap-sass'
gem 'bourbon'
gem 'devise'
gem 'devise_invitable'
gem 'high_voltage'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'rails_admin'
gem 'simple_form'
gem 'therubyracer', :platform=>:ruby
gem 'thin'
gem 'omniauth-facebook'

group :development do
  #gem 'better_errors'
  #gem 'hub', :require=>nil
  #gem 'rails_layout'
end
group :development, :test do
  gem 'rubocop'
end

#pwa
gem "serviceworker-rails"

#simple form
#gem 'simple_form'
gem "stripe"
gem "gravtastic"
gem "capistrano"

