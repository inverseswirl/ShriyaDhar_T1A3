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

 case intro.intro_input
 when 1
    item.display_list(item.quantity)
 when 2
    item.add_sold_units
    item.quantity_update
 when 3
    item.replenish_stock(item.quantity)
when 4
     intro.intro_input == 4 
when 5
        item.add_sold_units
        item.sales(item.quantity, item.units_sold)
when 6
    break 
   end
end
     

  
























