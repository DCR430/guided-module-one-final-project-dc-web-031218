require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  Pry.start
end

desc 'seed data from json files'
task :seed do
	require_relative 'db/seed.rb'
end