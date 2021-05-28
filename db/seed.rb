# Parse the CSV and seed the database here! Run 'ruby database/seed' to execute this code.
require "sqlite3"
require 'csv'
require "pry"

database = SQLite3::Database.new(":memory:")
database = {:conn => SQLite3::Database.new("JohnStewartShow")}

# Create a database
show_table = <<-SQL
  create table JohnStewartShow (
    id integer primary key,
    year integer,
    occupation text,
    show_date text,
    category text,
    name text
    );
  SQL
  
database[:conn].execute(show_table)

csv = File.read('daily_show_guests.csv') # couldn't get CSV.read to work

CSV.parse(csv, headers: true).each_with_index do |row, index|
  input = <<-SQL
    insert into JohnStewartShow (id, year, occupation, show_date, category, name)
    values (?,?,?,?,?,?)
    SQL
  database[:conn].execute(input, index, row.fields)
end

