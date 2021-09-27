require_relative './inventory/items'
require_relative './inventory/intro'

 
intro = Intro.new
item= Item.new
box = TTY::Box
puts box.frame intro.intro_message.light_cyan, height: 8, border: :thick
puts intro.intro_description.light_blue





loop do
  puts intro.inventory_options
  intro.input

  if intro.intro_input == 1 
     display_stock
     
  elsif intro.intro_input == 2  
     update_inventory_stock
  elsif intro.intro_input == 3 
     reorder_level
  elsif intro.intro_input == 4
      
  elsif intro.intro_input == 5 
     regular_updates_of_inventory
  elsif intro.intro_input == 6
     sales 
  end
end























