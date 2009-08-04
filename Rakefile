require 'spec/rake/spectask'

task :default => :test
task :test => :spec

if !defined?(Spec)
  puts "spec targets require RSpec"
else
  desc "Run all examples"
  Spec::Rake::SpecTask.new('spec') do |t|
    t.spec_files = FileList['spec/**/*.rb']
    t.spec_opts = ['-cfs']
  end
end


namespace :db do
  require 'active_record'
  desc "Migrate the database through scripts in db/migrate"  
    task(:migrate => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end  
  
  desc "setup in memory testing db"
  task :setuptesting do
     ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => 'db/testing.sqlite3')
     ActiveRecord::Base.logger = Logger.new(STDOUT)
     ActiveRecord::Migration.verbose = true
     ActiveRecord::Migrator.migrate("db/migrate")  
  end

  task :environment do  
   ActiveRecord::Base.establish_connection(YAML::load(File.open('db/database.yml')))  
  end
end

namespace :gems do
  desc 'Install required gems'
  task :install do
    required_gems = %w{ sinatra rspec rack-test active_record sqlite3-ruby  }
    required_gems.each { |required_gem| system "sudo gem install #{required_gem}" }
  end
end

