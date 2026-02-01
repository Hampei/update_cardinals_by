require 'rubygems'
require 'bundler/setup'
require 'active_record'
Bundler.require(:default, :development)

require 'update_cardinals_by'

Dotenv.load

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

RSpec.configure do |config|
  config.before(:suite) do
    ActiveRecord::Tasks::DatabaseTasks.truncate_all
  end
  config.after(:each) do
    ActiveRecord::Tasks::DatabaseTasks.truncate_all
  end
end
