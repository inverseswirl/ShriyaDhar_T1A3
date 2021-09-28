require "tty-prompt"
require 'terminal-table'
require 'colorize'
require 'tty-prompt'



#defining classes...
#problem statement......

#finished goods inventory
# Scented candles......
# data for scented candles- 
# Problems statements- FEATURE ONE-UPDATE DAILY INVENTORY(Product wise)
# 1. Existing initial quantity purchased is given.
# 2. How to enter details for number of units sold per day.?
# 3. How to retrieve how many units left?


#- feature get sales
#- feature replenish stock






#Module inventory for first Feature........
# module Inventory

  
  class Item
    attr_accessor :name, :price, :quantity, :units_sold, :updated_quantity, 
    :update_input, :reorder_level, :notification, :total_sales
    :stock_in
  
    def initialize
     @name = ["scented_candles", "greeting_cards", "wall_clocks", 
      "photo_frames", "soft_toys", "perfume_bottles", "chocolate_boxes", 
      "Jigsaw_puzzle_box", "souvenir_mugs", "novels"]
      @price = [15, 10, 50, 18, 70, 150, 65, 78, 25, 20]
      @quantity = [104, 200, 20, 30, 20, 22, 25, 15, 30, 50]
      @reorder_level = []
      @units_sold = []
      @updated_quantity = []
      @notification = []
      @total_sales = []
    end
    
   
   
  def find_reorder_level
    i=0
    average_lead_time = [10, 10, 20, 15, 30, 24, 10, 20, 15, 23] # in days
    average_daily_units_sold = [4, 10, 1, 2, 4, 3, 10, 4, 5, 6]
    while i < @name.length
       @reorder_level[i] =  average_daily_units_sold[i] * average_lead_time[i]
      i+=1
    end
    return @reorder_level
  end

  def item_notification
    find_reorder_level
    0.upto(@name.length - 1) do |n|
     if @quantity[n] < @reorder_level[n] 
         @notification << "Very Low in stock".red.on_black
     elsif  @quantity[n] == @reorder_level[n] 
        @notification << "Reached reorder level".yellow
     elsif quantity[n] > @reorder_level[n] 
        @notification << "Stock full".light_green
     end
    end
    return @notification
  end



  def replenish_stock(quantity,notification)
    @quantity =  quantity 
    @notification = notification 
    @reorder_level = find_reorder_level

    @stock_in = []

    count=0
    until count > @name.length - 1
       @stock_in[count] =  @reorder_level[count] + 10
       count+=1
    end

    stock_full = true
    for counter in (0..9) do
        next if @notification[counter] == "Stock full"
        if @notification[counter] != "Stock full"
           @quantity[counter] =  @quantity[counter] + @stock_in[counter]  #assume 10units saftey stock for each item
        end
           
    end
    # p @quantity
    #     @notification = item_notification
      
    rows = []
      i = 0
       while i < @name.length
        
          rows << [@name[i].capitalize, @price[i], @quantity[i],@stock_in[i],
          @reorder_level[i], @notification[i]]
          rows << :separator 
          i+=1
        end 

       table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
        .light_green, 'Updated Quantity'.light_green,"Stock In".light_green, 
        "Optimal Reorder Level".light_green,
        "Notification".light_green], 
        :rows => rows, :title => " View Replenished stock".light_blue.on_black
        
        table.align_column(1, :center)
        table.align_column(2, :center)
        table.align_column(3, :center)
        table.align_column(4, :center)
      puts table
    
  end


  def display_list(quantity)
    @reorder_level = find_reorder_level
    @notification = item_notification
    @quantity =  quantity 
    rows = []
    i=0
    while i < @name.length
      rows << [@name[i].capitalize, @price[i], @quantity[i], @reorder_level[i],
    notification[i]]
      rows << :separator 
      i+=1
    end
 
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
     .light_green, "Initial Quantity".light_green, "Optimum Reorder level".light_green,
     "Notification".light_green], 
    :rows => rows, :title => " Inventory"
    .blue
    puts table
  end


  def message_exit_after_update
    puts "Type 'yes' to continue or 'no' to exit(yes/no)"
    puts "\n"
    @update_input = gets.strip 
  end

 #adds sold units......
  def add_sold_units
    i=0
    while i < @name.length
     units_sold_prompt = "----------------------------------------\n"\
                         "#{i + 1}. Add no. of #{@name[i]} sold : "

     print units_sold_prompt
     input_user = gets.strip
     puts "\n"
     if input_user =~ /\D/ || input_user.empty? == true 
     #to limit input of too many digits beyond the maximum selling units= 30, no characters and alphabets
        puts " Invalid input: ".light_red.on_black + "add positive integer only"
       .light_red.on_black
        next
     elsif input_user.to_i > 100
      puts "Maximum limit 100,try smaller range".light_red.on_black
      next
     elsif input_user =~ /[0-9]/ 
        @units_sold[i] = input_user.to_i
     end
     i+=1
    end
     return @units_sold
  end


  def quantity_update
    @reorder_level = find_reorder_level
    @notification = item_notification
    q=0
    while q < @name.length
       @quantity[q] = @quantity[q] - @units_sold[q]
      q+=1
    end

    rows = []
     i=0
     while i < @name.length
        rows << [@name[i].capitalize, @price[i], @quantity[i], 
        @units_sold[i], @reorder_level[i], notification[i]]
        rows << :separator 
        i+=1
      end
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
      .light_green, "Quantity".light_green, "Units_sold".light_green, 
    "Optimal Reorder level".light_green, "Notification".light_green], 
      :rows => rows, :title => " Quantity Update ".light_blue.on_black
     puts  table
      return @quantity
  end
 
 
  def regular_daily_update
    @reorder_level = find_reorder_level
    @notification = item_notification

   q=0
    while q < @name.length
      @updated_quantity[q] = @updated_quantity[q] - @units_sold[q]
     q+=1
    end
   

    rows = []
    i=0
    while i < @name.length
       rows << [@name[i].capitalize, @price[i], @updated_quantity[i], 
       @units_sold[i], @reorder_level[i], @notification[i]]
       rows << :separator 
       i+=1
    end
    
 
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Price(AUD$)'
     .light_green, "Updated Quantity".light_green, "Units_sold".light_green, 
     "Optimal reorder quantity".light_green], 
     :rows => rows, :title => " Inventory".light_blue.on_black
    puts table

  end


   
     


  def sales(quantity,units_sold)
    @quantity = quantity 
    @units_sold =  units_sold 
     t = 0
    while t < @name.length
      @quantity[t] = @quantity[t] - @units_sold[t]
     t+=1
   end
  
     @sales = []
     q =0
     while q < @name.length
      @sales[q] =  @units_sold[q] * @price[q]
      q+=1
     end

       if @total_sales.length == 0
           (0..9).each do |n|
             @total_sales << @sales[n]
            end
        else
          (0..9).each do |n|
            @total_sales[n] = @total_sales[n] + @sales[n]
          end
        end

   rows = []
    i=0
    while i < @name.length
       rows << [@name[i].capitalize, @price[i], @quantity[i], 
       @units_sold[i], @sales[i], @total_sales[i]]
       rows << :separator 
       i+=1
    end
  
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
     .light_green, "Quantity".light_green, "Units_sold".light_green, 
     "Sales(AUD$)".light_green, "Cumulative Sales".light_green], 
     :rows => rows, :title => " Sales Check ".light_blue.on_black
    
    puts table
  end

 

  end

# end























  def regular_updates_of_inventory
    item= Item.new
    item.add_sold_units
    item.message_exit_after_update
  
    loop do 
      if item.update_input == "yes" 
        item.add_sold_units
        item.regular_daily_update
        item.message_exit_after_update
      end
      break item.update_input == "no" 
      if item.update_input != "no" && item.update_input != "yes"
        puts "Incorrect Input: enter - yes or no\n".red.on_black + "-------------------------\n".light_cyan
      end
      item.message_exit_after_update
    end
    #work in progress................
  end
  








