require_relative './groceryItem.rb'

$total_price_before_discount = 0
$total_price_after_discount = 0

def accept_user_items
  puts "Please enter all the items purchased separated by a comma"
  items_bought = gets.chomp.split(',')
  
  create_item "milk", items_bought if items_bought.include?('milk')
  create_item "bread", items_bought if items_bought.include?('bread')
  create_item "banana", items_bought if items_bought.include?('banana')
  create_item "apple", items_bought if items_bought.include?('apple')  
end

def create_item item_name, items_bought
  quantity = items_bought.count(item_name)
  GroceryItem.new(item_name, quantity)
  puts "#{$total_price_after_discount}++++"
  # puts $total_price_before_discount
end

accept_user_items