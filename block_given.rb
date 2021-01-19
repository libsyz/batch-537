def greet(name)
  if block_given?
    puts "#{name} #{yield}"
  else
    puts "#{name}"
end


greet('Aseem') { 'mister mister' }
