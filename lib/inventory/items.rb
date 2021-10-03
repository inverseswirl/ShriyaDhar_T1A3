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


class Item
  attr_accessor :name, :price, :quantity, :units_sold,
  :update_input, :reorder_level, :notification, :sales, :total_sales,
  :stock_in, :quantity_previous, :before_replenish, :list_of_units, :input_user,
  :previous_sales
  
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
    @notification = []
    @before_replenish = []
    @sales = []
    @total_sales = []
    @previous_sales = []
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


  def display_list
    @reorder_level = find_reorder_level
    @notification = item_notification
    rows = []
    i=0
    while i < @name.length
      rows << [@name[i].capitalize, @price[i], @quantity[i], @reorder_level[i],
    notification[i]]
      rows << :separator 
      i+=1
    end
 
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
     .light_green, "Quantity".light_green, "Optimum Reorder level".light_green,
     "Notification".light_green], 
    :rows => rows, :title => " Inventory"
    .blue
    puts table
    return @quantity
  end



  def add_sold_units
    @units_sold = []
    i=0
    while i < @name.length
     units_sold_prompt = "----------------------------------------\n"\
                         "#{i + 1}. Add no. of #{@name[i]} sold : "

     print units_sold_prompt
     @input_user = gets.strip
     puts "\n"
     if @input_user =~ /\D/ || @input_user.empty? == true 
     #to limit input of too many digits beyond the maximum selling units= 100, no characters and alphabets
        puts " Invalid input: ".light_red.on_black + "add positive integer only"
       .light_red.on_black
        next
     elsif @input_user.to_i > 100
      puts "Maximum limit 100,try smaller range".light_red.on_black
      next
     elsif @input_user =~ /[0-9]/ 
        @units_sold[i] = @input_user.to_i
      end
     i+=1
    end
    return @units_sold
  end


  def store_units(units_sold)
      @units_sold = units_sold
      @list_of_units << @units_sold
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
 
 
 

  def cumulative_sales (sales)
     @sales = sales
   
    t = 0
    begin
     if @list_of_units.length == 1
       (0..9).each do |n|
         @total_sales[n] = @sales[n]
        end
      elsif  @list_of_units.length > 1
        (0..9).each do |n|
          @total_sales[n] = @total_sales[n] + @sales[n]
        end
      end

      (0..9).each do |n|
        @previous_sales[n] = @total_sales[n] - @sales[n]
      end

    rescue
      puts "Note guide : Exit and try again".magenta
    end
    return @total_sales
  end

  
 
  def get_sales(quantity,units_sold)
    @quantity = quantity 
    @units_sold =  units_sold 

    q =0
     while q < @name.length
      @sales[q] =  @units_sold[q] * @price[q]
      q+=1
    end
    return @sales
  end


  def get_top_selling_item(total_sales, sales)
    @total_sales = total_sales
    @sales = sales
    t = 0
    i = 0
    @top_selling_product_sales = 0
   if @total_sales.empty? != true
      while t < @total_sales.length
       if @total_sales[t] > @top_selling_product_sales
         @top_selling_product_sales = @total_sales[t] 
          index_of_the_product = t
        end
       t+=1
      end

      rows = []
      while i < @name.length
        if i == index_of_the_product
         rows << [@name[i].capitalize, @price[i], @quantity[i], 
         @units_sold[i], @sales[i], "#{@total_sales[i]}$ (+)", "$$$ - #{@name[i]}".light_green]
        end
        i+=1
      end
   
     table = Terminal::Table.new :headings => ['Item'.light_green, 'Unit Price(AUD$)'
     .light_green, "Quantity".light_green, "Units_sold".light_green, 
     "Current Sales(AUD$)".light_green, "Cumulative Sales".light_green,
     "Top selling product".light_green], 
     :rows => rows, :title => " Top selling product ".light_blue.on_black
     puts table

    else
     puts 'Note: Add fresh Sold units before checking top selling product.'.light_green
    end
  end

  def display_sales
    t = 0
    rows = []
      while t < @name.length
        rows << [@name[t].capitalize, @price[t], @quantity[t], 
        @units_sold[t], @sales[t], "#{@total_sales[t]} " + "(#{@previous_sales[t]}+#{@sales[t]})".magenta]
        rows << :separator 
        t+=1
      end
      
    table = Terminal::Table.new :headings => ['Items'.light_green, 'Unit Price(AUD$)'
    .light_green, "Quantity".light_green, "Units_sold".light_green, 
    "Current Sales(AUD$)".light_green, "Cumulative Sales$(Previous + Current sales)".light_green], 
    :rows => rows, :title => " Sales Check ".light_blue.on_black
    puts table
  end
  
end
  







































