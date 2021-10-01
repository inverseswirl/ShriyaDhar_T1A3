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
    :update_input, :reorder_level, :notification, :sales, :total_sales,
    :stock_in, :quantity_previous, :before_replenish, :list_of_units, :temp
  
    def initialize
     @name = ["scented_candles", "greeting_cards", "wall_clocks", 
      "photo_frames", "soft_toys", "perfume_bottles", "chocolate_boxes", 
      "Jigsaw_puzzle_box", "souvenir_mugs", "novels"]
      @price = [15, 10, 50, 18, 70, 150, 65, 78, 25, 20]
      @quantity = [104, 200, 20, 30, 20, 22, 25, 15, 30, 50]
      @quantity_previous = []
      @reorder_level = []
      @units_sold = []
      @list_of_units = []
      @updated_quantity = []
      @notification = []
      @before_replenish = []
      @sales = []
      @total_sales = []
      @temp = []
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
    @reorder_level = find_reorder_level

    (0..9).each do |n|
     if @quantity[n] < @reorder_level[n] 
         @notification[n] = "Very Low in stock"
     elsif  @quantity[n] == @reorder_level[n] 
        @notification[n] = "Reorder level reached"
     elsif quantity[n] > @reorder_level[n] 
        @notification[n] = "Stock already full"
     end
    end
    return @notification
  end



  def replenish_stock(quantity)
    @quantity = quantity
    @reorder_level = find_reorder_level
    @notification = item_notification
    @stock_in = []

   
    count=0
    until count > @name.length - 1 
       @stock_in[count] =  @reorder_level[count] + 10
       count+=1
    end
  
    counter = 0
    (0..9).each do |counter|
      if @notification[counter] != "Stock already full"
        @quantity[counter] =  @quantity[counter] + @stock_in[counter]  #assume 10units saftey stock for each item
      else 
        next
      end
    end  
  

    (0..@name.length - 1).each do |n|
      if @notification[n] != "Stock already full"
        @before_replenish[n] =  @quantity[n] - @stock_in[n]  #assume 10units saftey stock for each item
        @before_replenish[n] = @before_replenish[n].to_s + " (+#{@stock_in[n]})".magenta
      else
        @before_replenish[n] = @quantity[n]
      end
    end   
  
    @notification = item_notification

    rows = []
      i = 0
       while i < @name.length
        rows << [@name[i].capitalize, @price[i], @before_replenish[i],
         stock_in[i], @quantity[i], @reorder_level[i], @notification[i]]
          rows << :separator 
          i+=1
        end 

       table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
        .light_green, "Previous Quantity".light_green, "Stock In".light_green,
        'Replenished Stock'.light_green, "Optimal Reorder Level".light_green,
        "Notification".light_green], 
        :rows => rows, :title => " View Replenished stock".light_blue.on_black
        
        table.align_column(1, :center)
        table.align_column(2, :center)
        table.align_column(3, :center)
        table.align_column(4, :center)
      puts table
    return @stock_in
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


  # def message_exit_after_update
  #   puts "Type 'yes' to continue or 'no' to exit(yes/no)"
  #   puts "\n"
  #   @update_input = gets.strip 
  # end



  def add_sold_units
   
    @units_sold = []
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


   def store_units(units_sold)
       @units_sold = units_sold
       @list_of_units << @units_sold
      p  list_of_units
     return @list_of_units
    end





  def quantity_update
    @reorder_level = find_reorder_level
    @notification = item_notification
 
    (0..@name.length - 1).each do |n|
       @quantity[n] = @quantity[n] - @units_sold[n]
    end
    (0..@name.length - 1).each do |n|
       @quantity_previous[n] = @quantity[n] + @units_sold[n]
       @quantity_previous[n]= @quantity_previous[n].to_s + " (-#{@units_sold[n]})".magenta
    end
    
    @notification = item_notification
    rows = []
     i=0
     while i < @name.length
        rows << [@name[i].capitalize, @price[i], @quantity_previous[i], 
        @units_sold[i],@quantity[i], @reorder_level[i], notification[i]]
        rows << :separator 
        i+=1
      end
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
      .light_green, "Previous Quantity".light_green, "Units_sold".light_green, 
      "Current quantity".light_green, "Optimal Reorder level".light_green, 
      "Notification".light_green], 
      :rows => rows, :title => " Quantity Update ".light_blue.on_black
     puts  table
      return @quantity
  end
 
 
  def top_selling #work in progress........................
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

  
  def cumulative_sales (sales)
     @sales = sales
   
    
    begin
     if @list_of_units.length == 1
       (0..9).each do |n|
         @total_sales[n] = @sales[n]
        end
      

       rows = []
        i = 0
       while i < @name.length
         rows << [@name[i].capitalize, @price[i], @quantity[i], 
         @units_sold[i], @sales[i], "#{@total_sales[i]}$ (+)".magenta]
         rows << :separator 
         i+=1
        end
    
       table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
       .light_green, "Quantity".light_green, "Units_sold".light_green, 
       "Current Sales(AUD$)".light_green, "Cumulative Sales".light_green], 
       :rows => rows, :title => " Sales Check ".light_blue.on_black
        puts table
        puts "Note: Add freshly sold units to calculate new sales. "

      elsif  @list_of_units[-2] != @units_sold
        (0..9).each do |n|
          @total_sales[n] = @total_sales[n] + @sales[n]
        end

        rows = []
         i=0
         while i < @name.length
           rows << [@name[i].capitalize, @price[i], @quantity[i], 
           @units_sold[i], @sales[i], "#{@total_sales[i]}$ (+)"]
           rows << :separator 
           i+=1
          end
      
        table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
        .light_green, "Quantity".light_green, "Units_sold".light_green, 
        "Current Sales(AUD$)".light_green, "Cumulative Sales".light_green], 
        :rows => rows, :title => " Sales Check ".light_blue.on_black
        puts table
        puts "Note guide : Next Add fresh sold units"
      end
    rescue
      puts "Note guide : Exit and try calculating sales immediately after adding units to capture initial sales".magenta
    end
  end

  
 

  def get_sales(quantity,units_sold)
    @quantity = quantity 
    @units_sold =  units_sold 


    q =0
     while q < @name.length
      @sales[q] =  @units_sold[q] * @price[q]
      q+=1
    end

   rows = []
    i=0
    while i < @name.length
       rows << [@name[i].capitalize, "#{@price[i]} (*)".yellow, @quantity[i], 
       "#{@units_sold[i]}".yellow, "#{@sales[i]}$".magenta, "#{@total_sales[i]}$()"]
       rows << :separator 
       i+=1
    end
  
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
     .light_green, "Current Quantity".light_green, "Units_sold".light_green, 
     "Sales(AUD$)".light_green, "Cumulative Sales".light_green], 
     :rows => rows, :title => " Sales Check ".light_blue.on_black
    
    # puts table
    return @sales
  end


end















# end























# def regular_updates_of_inventory
#   item= Item.new
#   item.add_sold_units
#   item.message_exit_after_update

#   loop do 
#     if item.update_input == "yes" 
#       item.add_sold_units
#       item.regular_daily_update
#       item.message_exit_after_update
#     end
#     break item.update_input == "no" 
#     if item.update_input != "no" && item.update_input != "yes"
#       puts "Incorrect Input: enter - yes or no\n".red.on_black + "-------------------------\n".light_cyan
#     end
#     item.message_exit_after_update
#   end
#   #work in progress................
# end









