require 'rubygems'
require 'sinatra'
require 'environment'
require 'erb'


configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  # add your helpers here
end

# root page
get '/' do
  @user = User.all()
  @time = Time.now()
  erb :root
end
