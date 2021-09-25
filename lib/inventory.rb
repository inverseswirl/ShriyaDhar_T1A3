require_relative './inventory/items'
require_relative './inventory/entry'
require 'colorize'
 
intro = Intro.new
item= Item.new
puts intro.intro_message
puts item.display_list
puts intro.inventory_options
# intro.intro_input = gets.strip.to_i

# puts "To get the reorder quantity, add sold units for each item"
# # puts item.add_sold_units
# puts item.get_reorder_quantity




# begin
#   loop do
#     item.message_for_item_update 
#     if item.update_input == "yes" 
#         puts item.add_sold_units  
#         puts item.quantity_update
#         break
#     elsif item.update_input == "no" 
#         break
#         else 
#         puts "Incorrect Input: enter - yes or no\n".red.on_black + "-------------------------\n".light_cyan
#     end
#   end
# rescue
#     puts "Error on line 11 on /inventory.rb"
# end











# loop do
# puts item.add_sold_units  
# puts item.regular_daily_update
# end





# puts Inventory.display_list

# puts Inventory.add_sold_units
# puts Inventory.quantity_update


# loop do 
# puts Inventory.update_quantity(Inventory.add_sold_units)
# end
# puts regular_quantity_update(Inventory.update_quantity(Inventory.add_sold_units))


