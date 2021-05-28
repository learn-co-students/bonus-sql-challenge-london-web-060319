# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances(database)
  # Who did Jon Stewart have on the Daily Show the most?
  query = <<-SQL 
  select name, COUNT(id) 
  from JohnStewartShow 
  group by name 
  order by COUNT(name) desc limit 1;
  SQL
  database[:conn].execute(query)
end

def most_popular_profession_each_year(database)
  # What was the most popular profession of guest for each year Jon Stewart hosted the Daily Show
  query = <<-SQL
  select year, occupation, count(id) as popular_profession
  from JohnStewartShow
  where year = ?
  group by occupation
  order by popular_profession desc limit 1
  SQL
  # e.g. 2009 |	actor	| 19
  profession_hash = {}
  for year in 1999..2015
    data = database[:conn].execute(query, year)
    profession_hash[year] = data[0][1..2]
    year+=1
  end
  profession_hash
end

def most_popular_profession(database)
  # What profession was on the show most overall?
  query =  <<-SQL
  select occupation, count(id) as popular_profession
  from JohnStewartShow
  group by occupation
  order by popular_profession desc limit 1
  SQL
  database[:conn].execute(query)
end

def number_of_bills(database)
  # How many people did Jon Stewart have on with the first name of Bill?
  query = <<-SQL
  select count(id)
   from JohnStewartShow 
   where name like "bill%"
  SQL
  database[:conn].execute(query)
end

def patrick_stewart_appearance(database)
  # What dates did Patrick Stewart appear on the show?
  query = <<-SQL
  select year from JohnStewartShow 
    where name = "Patrick Stewart"
  SQL
  database[:conn].execute(query)
end

def year_with_most_guests(database)
  # Which year had the most guests?
  query = <<-SQL
  select year, count(id) as guest_count
    from JohnStewartShow
    group by year
    order by guest_count desc limit 1
  SQL
  database[:conn].execute(query)
end

def most_popular_category_each_year(database)
  # What was the most popular "Group" for each year Jon Stewart hosted?
  query = <<-SQL
  select year, category, count(id) as popular_category
  from JohnStewartShow
  where year = ?
  group by category
  order by popular_category desc limit 1
  SQL
  # e.g. 2003	| Acting | 74
  category_hash = {}
  for year in 1999..2015
    data = database[:conn].execute(query, year)
    category_hash[year] = data[0][1..2]
    year+=1
  end
  category_hash
end



