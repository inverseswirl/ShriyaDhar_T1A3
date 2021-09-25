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





#Module inventory for first Feature........
# module Inventory

  
  class Item
    attr_accessor :name, :price, :quantity, :units_sold, :updated_quantity, :update_input

   def initialize
     @name = ["scented_candles", "greeting_cards", "wall_clocks", 
      "photo_frames", "soft_toys", "perfume_bottles", "chocolate_boxes", 
      "Jigsaw_puzzle_box", "souvenir_mugs", "novels"]
      @price = [15, 10, 50, 18, 70, 150, 65, 78, 25, 20]
      @quantity = [65, 100, 20, 30, 20, 22, 25, 15, 30, 50]
      @units_sold = []
      @updated_quantity = []
    end
    
   
   
 
  

  def display_list
    puts " Current Inventory   \n"\
         "--------------------"
    
    time = Time.new
    rows = []
    i=0
     @name.length
     while i < @name.length
      rows << [@name[i].capitalize, @price[i], @quantity[i]]
      rows << :separator 
      i+=1
     end
 
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Price(AUD$)'
     .light_green, "Quantity".light_green], 
    :rows => rows, :title => " Inventory Check"
    .light_blue.on_black
    return table

  end


  def message_for_item_update
    puts "Do you want to update inventory & add sold units?"
    puts "Options - yes or no"
    puts "\n"
    @update_input = gets.strip 
    
 
  end

 #adds sold units......
  def add_sold_units

    rows = []
 
    i=0
    while i < @name.length
     units_sold_prompt = "----------------------------------------\n"\
                         "Add no.of units of #{@name[i]} sold \n"\
                         "----------------------------------------"
     puts units_sold_prompt.light_cyan
     input_user = gets.strip.to_i
     if input_user != 0
         @units_sold[i] = input_user
      else
       puts "ERROR ".light_red.on_black + " :Invalid input, add integer only"
       .light_red.on_black
      next 
     end
      i+=1
    end
  end


  def quantity_update
    
    puts "                     Updated Inventory\n "\
          "                  ----------------------"
    q=0
    while q < @name.length
      @updated_quantity[q] = (@quantity[q] - @units_sold[q])
    q+=1
    end


     rows = []
     i=0
     while i < @name.length
        rows << [@name[i].capitalize, @price[i], @updated_quantity[i], 
        @units_sold[i]]
        rows << :separator 
        i+=1
      end
   
     table = Terminal::Table.new :headings => ['Items'.light_green, 'Price(AUD$)'
      .light_green, "Quantity".light_green, "Units_sold".light_green], 
      :rows => rows, :title => " Inventory Check ".light_blue.on_black
     
    puts table
  end

 
  def regular_daily_update
    

    q=0

 
    while q < @name.length
      @updated_quantity[q] = (updated_quantity[q] - @units_sold[q])
    q+=1
    end

    rows = []
    i=0
    while i < @name.length
       rows << [@name[i].capitalize, @price[i], @updated_quantity[i], 
       @units_sold[i]]
       rows << :separator 
       i+=1
     end
  
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Price(AUD$)'
     .light_green, "Quantity".light_green, "Units_sold".light_green], 
     :rows => rows, :title => " Inventory Check ".light_blue.on_black
    
   puts table



  end

  
 end

# end




