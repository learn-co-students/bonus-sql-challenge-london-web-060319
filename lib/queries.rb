# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
  # write your query here!
  query1 = <<-SQL 
  SELECT name, COUNT(id) 
  FROM JohnStewartShow 
  GROUP BY name 
  ORDER BY COUNT(name) DESC LIMIT 1;
  SQL
  database[:conn].execute(query1)
end


