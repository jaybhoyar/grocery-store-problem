
def accept_user_items
  puts "Please enter all the items purchased separated by a comma"
  items_bought = gets.chomp.split(',')
  puts items_bought
end

accept_user_items