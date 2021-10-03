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
  system("clear")

  case intro.intro_input
  when 1
    item.display_list
  when 2
    item.add_sold_units
    item.quantity_update
    item.store_units(item.units_sold)
    item.get_sales(item.quantity, item.units_sold)
    item.cumulative_sales(item.sales)

  when 3
    item.replenish_stock(item.quantity)
  when 4
    if item.list_of_units.empty? == true
      puts "Note: Please Add Sold units before obtaining sales".green.on_black
    else
    item.display_sales
    end
  when 5
    item.get_top_selling_item(item.total_sales, item.sales)
  when 6
    break
   end
end
     
























