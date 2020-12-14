class GroceryItem
  attr_accessor :item_name, :item_quantity, :item_price_after_discount, :item_price_before_discount
  def initialize(item_name, item_quantity)
    @items_details = {
      "milk" => {  
        "unit_price" => 3.97,
        "sale_unit_price" => 2.50
      },
      "bread" => { 
        "unit_price" => 2.17, 
        "sale_unit_price" => 2.0, 
      }, 
      "apple" => { 
        "unit_price" => 0.89
      },"banana" =>{ 
        "unit_price" => 0.99 
      }
    }
    @item_name = item_name
    @item_quantity = item_quantity
    @item_price_after_discount = calculate_item_price_after_discount
    @item_price_before_discount = calculate_item_price_before_discount  
  end
  
  def calculate_item_price_after_discount
    case @item_name
    when "milk"
      sale_on_quantity = 2
      final_milk_price = discount_calculator(@items_details[@item_name]["unit_price"], @items_details[@item_name]["sale_unit_price"],sale_on_quantity)
      return final_milk_price 
    when "bread"
      sale_on_quantity = 3
      final_bread_price = discount_calculator(@items_details[@item_name]["unit_price"], @items_details[@item_name]["sale_unit_price"],sale_on_quantity)
      return final_bread_price
    when "banana"
      return @items_details[@item_name]["unit_price"]
    when "apple"
      return @items_details[@item_name]["unit_price"]
    end
  end

  def calculate_item_price_before_discount
    return @items_details[@item_name]["unit_price"] * @item_quantity
  end

  def discount_calculator(item_unit_price, item_sale_unit_price, sale_on_quantity)
    item_price_after_discount = 0 
    if @item_quantity < sale_on_quantity
      item_price_after_discount = item_unit_price * @item_quantity
      return item_price_after_discount
    end
    if @item_quantity >= sale_on_quantity
      item_price_after_discount = ((item_sale_unit_price * sale_on_quantity) * (@item_quantity / sale_on_quantity) ) + (item_unit_price * (@item_quantity % sale_on_quantity))
      return item_price_after_discount
    end
  end
end