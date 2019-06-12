# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
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



