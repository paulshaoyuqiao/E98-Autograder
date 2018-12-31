puts 'What do you want?'
response = gets.chomp
response = %Q(") + response + %Q(")
puts "HOW CAN YOU SAY " + response.upcase +  "?! YOU'RE FIRED!"
