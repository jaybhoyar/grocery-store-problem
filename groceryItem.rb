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

    case @item_name
    when "milk"
      sale_on_quantity = 2
      final_milk_price = calculate_price_after_discount(@items_details[@item_name]["unit_price"], @items_details[@item_name]["sale_unit_price"],sale_on_quantity)

      $total_price_before_discount += @items_details[@item_name]["unit_price"] * @item_quantity
      $total_price_after_discount += final_milk_price
      final_milk_price 
    when "bread"
      sale_on_quantity = 3
      final_bread_price = calculate_price_after_discount(@items_details[@item_name]["unit_price"], @items_details[@item_name]["sale_unit_price"],sale_on_quantity)

      $total_price_before_discount += @items_details[@item_name]["unit_price"] * @item_quantity
      $total_price_after_discount += final_bread_price
      final_bread_price
    when "banana"
      $total_price_before_discount += @items_details[@item_name]["unit_price"] * @item_quantity
      $total_price_after_discount += $total_price_before_discount
    when "apple"
      $total_price_before_discount += @items_details[@item_name]["unit_price"] * @item_quantity
      $total_price_after_discount += $total_price_before_discount
    end
  end

  def calculate_price_after_discount(item_unit_price, item_sale_unit_price, sale_on_quantity)
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