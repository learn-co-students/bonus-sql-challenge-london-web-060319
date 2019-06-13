require 'bundler'
Bundler.require

# Setup a DB connection here
database = {:conn => SQLite3::Database.new("JohnStewartShow")}

require_relative "../lib/queries.rb"

puts guest_with_most_appearances(database)
puts "---------"

puts most_popular_profession_each_year(database)
puts "---------"

puts most_popular_profession(database)
puts "---------"

puts year_with_most_guests(database)
puts "---------"

puts most_popular_category_each_year(database)
puts "---------"



