puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "What is your middle name?"
middle_name = gets.chomp
middle_name = ' ' + middle_name
last_name = ' ' + last_name + '!'
puts "Hello, " + first_name + middle_name + last_name
