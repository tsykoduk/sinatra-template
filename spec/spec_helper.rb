require 'rubygems'
require 'active_record'
require 'active_record/fixtures'
require 'erb'
require 'ostruct'
require 'yaml'
require 'sinatra'
require 'spec'
require 'spec/interop/test'
require 'rack/test'
require 'rake'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

system "rm db/testing.sqlite3"
system "rake db:setuptesting"



require 'application'


Spec::Runner.configure do |config|

  config.before(:each) {
    ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => 'db/testing.sqlite3')  
        }
end
