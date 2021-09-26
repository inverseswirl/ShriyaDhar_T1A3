require_relative './inventory/items'
require_relative './inventory/intro'
require 'colorize'
 
intro = Intro.new
item= Item.new
puts intro.intro_message



loop do
  
  puts intro.inventory_options
  intro.intro_input = gets.strip.to_i
  puts "\n"

  if intro.intro_input == 1 
     item.display_list
  elsif intro.intro_input == 2  
      update_current_inventory 
   
    elsif intro.intro_input == 3 
        reorder_level
    # elsif intro.intro_input == 4 
    #    Options.regular_updates_of_inventory
    # elsif intro.intro_input == 4 && options_array.include?(2) == false
    #     puts "\n"
    #    Options.update_current_inventory 
     elsif intro.intro_input == 5
       revenue

   end
end








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













