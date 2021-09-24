require "tty-prompt"
require 'terminal-table'
require 'colorize'


#defining classes...
#problem statement......
=begin
#finished goods inventory
# Scented candles......
# data for scented candles- 
Problems statements- FEATURE ONE-UPDATE DAILY INVENTORY(Product wise)
1. Existing initial quantity purchased is given.
2. How to enter details for number of units sold per day.?
3. How to retrieve how many units left?
 
=end

=begin
Problems statements- two(Sales report)
1.unit price of the product?   #revenue
2. Items sold            #revenue
3. Cost of good sold
4. profit 
5. margin
=end

module Inventory

  
  class Item
    attr_accessor :name, :price, :initial_quantity
   def initialize
     @name = ["scented_candles", "greeting_cards", "wall_clocks", 
      "photo_frames", "soft_toys", "perfume_bottles", "chocolate_boxes", 
      "Jigsaw_puzzle_box", "souvenir_mugs"]
      @price = [15, 10, 50, 18, 70, 150, 65, 78, 25]
      @initial_quantity = [65, 100, 20, 30, 20, 22, 25, 15, 30]
   end
  end

  def Inventory.add_sold_units
    item=Item.new
    rows = []
    i=0

    while i < 9
     units_sold_prompt = "----------------------------------------\n"\
                         "Add no.of units of #{item.name[i]} sold \n"\
                         "----------------------------------------"
     puts units_sold_prompt.light_cyan
     input_user = gets.strip.to_i
     if input_user != 0
       rows << [item.name[i].capitalize, item.price[i], item.initial_quantity[i],
      input_user] 
      else
       puts "ERROR ".light_red.on_black + " :Invalid input, add integer only"
       .red.on_black
      next 
     end
      rows << :separator 
      i+=1
    end

    table = Terminal::Table.new :headings => ['Items', 'Price(AUD$)', "Quantity",
    "Units Sold"], 
    :rows => rows, :title => " Inventory Check "
    return table
 
    #  end
  end

  def Inventory.display_list
   item = Item.new
   rows = []
   i=0

    while i < 9
     rows << [item.name[i].capitalize, item.price[i], item.initial_quantity[i]]
     rows << :separator 
     i+=1
    end

   table = Terminal::Table.new :headings => ['Items', 'Price(AUD$)', "Quantity"], 
   :rows => rows, :title => " Inventory Check "
   return table
  end

end




puts Inventory.add_sold_units


