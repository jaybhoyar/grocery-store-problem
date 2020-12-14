require_relative './groceryItem.rb'
require 'terminal-table'

$all_prices_after_discount = []
$all_prices_before_discount = []
$items_bought = []
$table_data = []

def accept_user_items
  puts "Please enter all the items purchased separated by a comma"
  $items_bought = gets.chomp.split(',')
  
  create_item("milk") if $items_bought.include?('milk')
  create_item( "bread") if $items_bought.include?('bread')
  create_item("banana") if $items_bought.include?('banana')
  create_item("apple") if $items_bought.include?('apple')  
  display_bill_table
end

def create_item(item_name)
  quantity = $items_bought.count(item_name)
  single_item = GroceryItem.new(item_name, quantity)
  $table_data << [single_item.item_name.capitalize(), single_item.item_quantity, "$#{single_item.item_price_after_discount}"]
  $all_prices_after_discount.push(single_item.item_price_after_discount)
  $all_prices_before_discount.push(single_item.item_price_before_discount)
end

def display_bill_table 
  table = Terminal::Table.new :headings => ['Item', 'Quantity', 'Price'], :rows => $table_data
  puts table
  generate_receipt
end

def generate_receipt
  amount_saved = ($all_prices_before_discount.sum - $all_prices_after_discount.sum).round(2)
  puts"\n Total price: $#{ $all_prices_after_discount.sum.round(2)} \n You saved $#{amount_saved} today."
end

accept_user_items
#milk,milk,bread,banana,bread,bread,bread,milk,apple