class GroceryItem
  attr_accessor :item_name, :item_quantity, :item_price
  def initialize(item_name, item_quantity)
    @item_name = item_name
    @item_quantity = item_quantity
    @item_price = calculate_item_price  
  end
  
  def calculate_item_price
    @items_details = {
      "milk" => {  
        "unit_price" => 3.97,
        "sale_unit_price" => 2.50, 
        "sale_on_quantity" => 2
      },
      "bread" => { 
        "unit_price" => 2.17, 
        "sale_unit_price" => 2.0, 
        "sale_on_quantity" => 3
      }, 
      "apple" => { 
        "unit_price" => 0.89
      },"banana" => { 
        "unit_price" => 0.99 
      }
    }
    
  end
end