require_relative './inventory/items'
require_relative './inventory/intro'

 
intro = Intro.new
item= Item.new
box = TTY::Box
puts box.frame intro.intro_message.light_blue, height: 8, border: :thick
puts intro.intro_description.magenta





loop do
  puts "\n"
  puts intro.inventory_options
  intro.input
  system "clear"

  if intro.intro_input == 1 
     display_stock
   elsif intro.intro_input == 2  
    update_inventory_stock
   elsif intro.intro_input == 3
        # item.display_list
        item.replenish_stock
   elsif intro.intro_input == 4 
       regular_updates_of_inventory
   elsif intro.intro_input == 5
       sales 
   elsif intro.intro_input == 6
       break 
   end
end
     

  
























