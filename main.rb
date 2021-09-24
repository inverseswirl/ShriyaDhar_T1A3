require "tty-prompt"
require 'terminal-table'


#defining classes...
#problem statement......
=begin
#finished goods inventory
# Scented candles......
# data for scented candles- 
Problems statements- FEATURE ONE-UPDATE DAILY INVENTORY(Product wise)
1. How to find an the existing stock, How many (units)(quantity) in stock?
2. How to enter details for number of units sold per day.?
3. How to retrieve how many units left?
4. How many units were purchased at the begining of the month.
 
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

  # def Inventory.update_quantity
  #   @item_sold_quantity = gets.strip.to_i
  #   if @item_sold_quantity.instance_of? Integer
       
  #   end

  # end
  class Item
    attr_accessor :name, :price, :initial_quantity
   def initialize
     @name = ["scented_candles", "greeting_cards", "wall_clocks", 
      "photo_frames", "soft_toys", "perfume_bottles", "chocolate_boxes", 
      "Jigsaw_puzzle_box", "souvenir_mugs"]
      @price = [15, 10, 50, 18, 70, 150, 65, 78, 25]
      @initial_quantity = [65, 100, 20, 30, 20, 15, 25, 12, 20]
   end
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

   table = Terminal::Table.new :headings => ['Items', 'Price', "Quantity"], 
   :rows => rows, :title => " Inventory Check "
   return table
  end

end
puts Inventory.display_list





