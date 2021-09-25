require_relative './items.rb'
require 'colorize'


item= Item.new


puts item.display_list 
# puts item.add_sold_units  
# puts item.quantity_update


loop do
    item.message_for_item_update 
    if item.update_input == "yes" 
        puts item.add_sold_units  
        puts item.quantity_update
        break
    elsif item.update_input == "no" 
        break
      else 
        puts "Error: enter - yes or no\n".red.on_black + "-------------------------\n".light_cyan
    end
end




# if item.update_input == "yes" 
#     puts item.add_sold_units  
#     puts item.quantity_update
# end


# loop do
# puts item.add_sold_units  
# puts item.regular_daily_update
# end

# elsif message1.update_input == "no"
#   exit
# else
#     puts "Try again with right input"
#     message1 = Message_Item_update.new


# end



# puts Inventory.display_list

# puts Inventory.add_sold_units
# puts Inventory.quantity_update


# loop do 
# puts Inventory.update_quantity(Inventory.add_sold_units)
# end
# puts regular_quantity_update(Inventory.update_quantity(Inventory.add_sold_units))


