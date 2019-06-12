# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances(database)
  # Who did Jon Stewart have on the Daily Show the most?
  query1 = <<-SQL 
  SELECT name, COUNT(id) 
  FROM JohnStewartShow 
  GROUP BY name 
  ORDER BY COUNT(name) DESC LIMIT 1;
  SQL
  database[:conn].execute(query1)
  # Fareed Zakaria	19
end

def most_popular_profession(database)
  # What was the most popular profession of guest for each year Jon Stewart hosted the Daily Show
  query2 = <<-SQL
  select year, occupation, count(id) as popular_profession
  from JohnStewartShow
  where year = ?
  group by occupation
  order by popular_profession desc limit 1
  SQL
  # e.g. 2009 |	actor	| 19
  content_hash = {}
  for year in 1999..2015
    # content_hash[year]||=[]
    data = database[:conn].execute(query2, year)
    content_hash[year] = data[0][1..2]
    year+=1
  end
  content_hash
end





