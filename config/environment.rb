require 'bundler'
Bundler.require

# Setup a DB connection here

database = {:conn => SQLite3::Database.new("JohnStewartShow")}

require_relative "lib/queries.rb"

guest_with_most_appearances(database)
most_popular_profession(database)

