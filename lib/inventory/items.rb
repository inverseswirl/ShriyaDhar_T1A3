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
    attr_accessor :name, :price, :quantity, :units_sold, :updated_quantity, 
    :update_input, :reorder_quantity, :first_day_units_sold
  
    def initialize
     @name = ["scented_candles", "greeting_cards", "wall_clocks", 
      "photo_frames", "soft_toys", "perfume_bottles", "chocolate_boxes", 
      "Jigsaw_puzzle_box", "souvenir_mugs", "novels"]
      @price = [15, 10, 50, 18, 70, 150, 65, 78, 25, 20]
      @quantity = [65, 100, 20, 30, 20, 22, 25, 15, 30, 50]
      @first_day_units_sold = [2, 7, 2, 1, 2, 6, 10, 2, 2, 1]
      @reorder_quantity = []
      @units_sold = []
      @updated_quantity = []
    end
    
   
   
  def get_reorder_level
    i=0
    average_lead_time = [10, 10, 20, 15, 30, 24, 10, 20, 15, 23] # in days
    average_daily_units_sold = [4, 14, 1, 3, 5, 3, 10, 4, 5, 6]
    while i < @name.length
       @reorder_quantity[i] =  average_daily_units_sold[i] * average_lead_time[i]
      i+=1
    end
    rows = []
     i=0
     while i < @name.length
        rows << [@name[i].capitalize, @price[i], @quantity[i],
        average_daily_units_sold[i], @reorder_quantity[i]]
        rows << :separator 
        i+=1
      end
   
     table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
      .light_green, 'Initial Quantity'.light_green, "Average Daily Units Sold".light_green, 
        "Optimal Reorder Quantity".light_green], 
      :rows => rows, :title => " Reorder level".light_blue.on_black
      
      table.align_column(1, :center)
      table.align_column(2, :center)
      table.align_column(3, :center)
      table.align_column(4, :center)
    # puts table
    return @reorder_quantity
  end
  

  def display_list
    puts " Shop's Current Inventory \n"\
         "------------------------------"
    rows = []
    i=0
    while i < @name.length
      rows << [@name[i].capitalize, @price[i], @quantity[i]]
      rows << :separator 
      i+=1
    end
 
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
     .light_green, "Initial Quantity".light_green], 
    :rows => rows, :title => " Inventory Check"
    .light_blue.on_black
    puts table
  end


  def message_exit_after_update
    puts "Type 'yes' to continue or 'no to exit"
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
     input_user = gets.strip
      if input_user =~ /[A-Z]/  ||  input_user =~ /[a-z]/ || input_user =~ /\-/ || input_user.empty? == true
        puts "Invalid input: ".light_red.on_black + "add positive integer only"
       .light_red.on_black
        next
      elsif input_user =~ /[0-9]/ 
        @units_sold[i] = input_user.to_i
      end
      i+=1
    end
  end


  def quantity_update
    puts "                     Updated Current Inventory\n "\
          "                  -----------------------------"
    q=0
    while q < @name.length
       @updated_quantity[q] = @quantity[q] - @units_sold[q]
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
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
      .light_green, "Quantity".light_green, "Units_sold".light_green], 
      :rows => rows, :title => " Quantity Update ".light_blue.on_black
    puts table
    return @updated_quantity
  end
 
 
  def regular_daily_update(arg)
      arg =  @reorder_quantity 
   q=0
    while q < @name.length
      @updated_quantity[q] = @updated_quantity[q] - @units_sold[q]
     q+=1
    end

    rows = []
    i=0
    while i < @name.length
       rows << [@name[i].capitalize, @price[i], @updated_quantity[i], 
       @units_sold[i], @reorder_quantity[i]]
       rows << :separator 
       i+=1
    end
    
 
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Price(AUD$)'
     .light_green, "Quantity".light_green, "Units_sold".light_green, 
     "Optimal reorder quantity".light_green], 
     :rows => rows, :title => " Inventory".light_blue.on_black
    puts table
    
  end

  def sales
    # cost_per_item = [3.78, 3.5, 45.8, 8.7, 55.2, 89.6, 38, 62, 12, 10]
    sales = []
    q = 0
    while q < @name.length
      sales[q] =  @units_sold[q] * @price[q]
     q+=1
    end
    rows = []
    i=0
    while i < @name.length
       rows << [@name[i].capitalize, @price[i], @updated_quantity[i], 
       @units_sold[i], sales[i] ]
       rows << :separator 
       i+=1
    end
  
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
     .light_green, "Quantity".light_green, "Units_sold".light_green, 
     "Sales(AUD$)".light_green], 
     :rows => rows, :title => " Sales Check ".light_blue.on_black
    
    puts table
  end

  end

# end



  def day
    puts "\n"
    puts "             ------"
    (1..5).each { |n| puts   puts "    Day #{n}"}
    puts "             ------"
  end




# module Options



  def update_current_inventory
    item = Item.new
    item.add_sold_units
    item.quantity_update
  end


  def reorder_level
    item= Item.new
    item.get_reorder_level
  end

  def regular_updates_of_inventory
    item= Item.new
    item.add_sold_units
    item.quantity_update
    item.message_exit_after_update
  
    loop do 
      if item.update_input == "yes" 
        item.add_sold_units
        item.regular_daily_update(item.get_reorder_level)
        item.message_exit_after_update
      end
      break item.update_input == "no" 
      if item.update_input != "no" && item.update_input != "yes"
        puts "Incorrect Input: enter - yes or no\n".red.on_black + "-------------------------\n".light_cyan
      end
      item.message_exit_after_update
    end

  end
  

  def sales
    item = Item.new
    item.add_sold_units
    item.quantity_update
    item.sales
  end
# end






