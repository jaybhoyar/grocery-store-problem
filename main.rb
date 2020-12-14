
def accept_user_items
  puts "Please enter all the items purchased separated by a comma"
  items_bought = gets.chomp.split(',')
  
  create_item "milk", items_bought if items_bought.include?('milk')
  create_item "bread", items_bought if items_bought.include?('milk')
  create_item "banana", items_bought if items_bought.include?('banana')
  create_item "apple", items_bought if items_bought.include?('apple')  
end

def create_item item_name, items_bought
  quantity = items_bought.count(item_name)
  puts quantity
end

accept_user_items