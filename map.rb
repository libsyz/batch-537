

students = [['john', 28], ['mary', 27]]

# [{name: John, age: 28}]
array = []
students.map do |pair|
  name, age = pair
  {name: name,
    age: age}
end

p somewhere
