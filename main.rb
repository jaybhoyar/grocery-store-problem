require_relative './groceryItem.rb'

$all_prices_after_discount = []
$all_prices_before_discount = []

def accept_user_items
  puts "Please enter all the items purchased separated by a comma"
  items_bought = gets.chomp.split(',')
  
  create_item "milk", items_bought if items_bought.include?('milk')
  create_item "bread", items_bought if items_bought.include?('bread')
  create_item "banana", items_bought if items_bought.include?('banana')
  create_item "apple", items_bought if items_bought.include?('apple')  
  puts "#{$all_prices_after_discount.sum}"
  puts "#{$all_prices_before_discount.sum}"
end

def create_item item_name, items_bought
  quantity = items_bought.count(item_name)
  single_item = GroceryItem.new(item_name, quantity)
  $all_prices_after_discount.push(single_item.item_price)
end

accept_user_items
#milk,milk,bread,banana,bread,bread,bread,milk,apple