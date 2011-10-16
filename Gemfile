source 'http://rubygems.org'

RAILS_VERSION = '~> 3.1.1.rc1'
DM_VERSION    = '~> 1.2.0.rc1'

gem 'rake', '0.8.7'

gem 'activesupport',      RAILS_VERSION, :require => 'active_support'
gem 'actionpack',         RAILS_VERSION, :require => 'action_pack'
gem 'actionmailer',       RAILS_VERSION, :require => 'action_mailer'
gem 'railties',           RAILS_VERSION, :require => 'rails'
gem 'rails',              RAILS_VERSION

gem 'jquery-rails'
gem 'rails-backbone'

gem 'dm-rails',             DM_VERSION#, git: "git://github.com/myobie/dm-rails.git"
gem 'dm-mysql-adapter',     DM_VERSION


gem 'dm-migrations',        DM_VERSION
gem 'dm-types',             DM_VERSION
gem 'dm-validations',       DM_VERSION
#gem 'dm-constraints',       DM_VERSION
gem 'dm-transactions',      DM_VERSION
gem 'dm-aggregates',        DM_VERSION
gem 'dm-timestamps',        DM_VERSION
gem 'dm-observer',          DM_VERSION
gem 'dm-serializer',        DM_VERSION
gem 'dm-ar-finders',        DM_VERSION
gem 'dm-chunked_query'
gem 'dm-zone-types', '0.3'

#gem 'geocoder', :git => "git://github.com/nitsujw/geocoder.git"

gem 'httparty', '0.8.0'
gem 'hashie', '1.1.0'

gem 'geocoder', :git => "git://github.com/nitsujw/geocoder.git"


group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier', '>= 1.0.3'
end



group(:development, :test) do

  # Uncomment this if you want to use rspec for testing your application

  # gem 'rspec-rails', '~> 2.0.1'

  # To get a detailed overview about what queries get issued and how long they take
  # have a look at rails_metrics. Once you bundled it, you can run
  #
  #   rails g rails_metrics Metric
  #   rake db:automigrate
  #
  # to generate a model that stores the metrics. You can access them by visiting
  #
  #   /rails_metrics
  #
  # in your rails application.

  # gem 'rails_metrics', '~> 0.1', :git => 'git://github.com/engineyard/rails_metrics'

end

