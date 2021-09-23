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


class Item
  attr_accessor :name, :price
  def initialize
   @name = ["scented_candles", "greeting_cards", "wall_clocks", 
    "photo_frames", "soft_toys", "perfume_bottles", "chocolate_boxes", "Jigsaw_puzzle_box", "souvenir_mugs"]
    @price = [15, 10, 50, 18, 70, 150, 65, 78, 25]
    # @item_sold_quantity = gets.strip.to_i
  end
  
  #def update_quantity_candle= (value)
  #end

  def display_list
  end
end

#list these two items

candle=Item.new
puts candle.name[0]
puts candle.price[0]
cards= Item.new
puts cards.name[1]
puts cards.price[1]

rows = []
rows << [candle.name[0], candle.price[0]]
rows << :separator 
rows << [cards.name[1], cards.price[1]]

table = Terminal::Table.new :headings => ['Items', 'Price'], :rows => rows, 
:title => " Inventory Check "

puts table
