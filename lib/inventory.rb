require_relative './inventory/items'
require_relative './inventory/intro'

 
intro = Intro.new
item= Item.new
box = TTY::Box
puts box.frame intro.intro_message.light_cyan, height: 8, border: :thick






loop do
  puts intro.inventory_options
  intro.intro_input = gets.strip.to_i
  puts "\n"

  if intro.intro_input == 1 
     display_initial_stock
  elsif intro.intro_input == 2  
     update_current_inventory 
  elsif intro.intro_input == 3 
     reorder_level
  elsif intro.intro_input == 4 
     regular_updates_of_inventory
  elsif intro.intro_input == 5
     sales 
  end
end























