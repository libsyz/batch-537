


def beautify_name(first_name, last_name)
  full_name = "#{first_name.capitalize} #{last_name.upcase}"
  yield(full_name)
end

message = beautify_name("john", "lennon")  do |name|
  "Greetings #{name}, you look quite fine today!"
end

p message
