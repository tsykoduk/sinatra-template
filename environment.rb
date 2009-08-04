require 'rubygems'
require 'active_record'
require 'erb'
require 'ostruct'
require 'yaml'

require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Your Application Name',
                 :author => 'Your Name',
                 :url_base => 'http://localhost:4567/'
               )

               dbconfig = YAML::load(File.open('db/database.yml'))  
               ActiveRecord::Base.establish_connection(dbconfig)
                 
  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end
