require 'colorize'
require 'tty-box'

class Intro
  attr_accessor :intro_description, :intro_message, :options, :intro_input
  def initialize
    @intro_message = "\n"\
"_ _ _ ____ _    ____ ____ _  _ ____    ___ ____      _ _  _ _  _ ____ _  _ ___ ____ ____ _   _    ____ ___  ___    /\n"\
"| | | |___ |    |    |  | |\\/| |___     |  |  |      | |\\ | |  | |___ |\\ |  |  |  | |__/  \\_/     |__| |__] |__]  /\n"\
"|_|_| |___ |___ |___ |__| |  | |___     |  |__|      | | \\|  \\/  |___ | \\|  |  |__| | \\    |      |  | |    |    .\n"\
"\n".light_blue
    
   @intro_description = "\n"\
    "  Hi, there! Welcome to the Inventory app!
This app will help an owner of a small Gift shop to manage his inventory stock,
display stock list, update inventory, get sales report and many other helpful tasks.\n"\
"-------------------------------------------------------------------------------------\n".strip
    @options = [
     "Display Inventory Stock", "Update Quantity", 
     "Display Reorder levels & items low in stock", 
     "Replenish low stock", "Regularly Update Inventory(ABC Analysis)",
     "Calculate Sales", "Exit the app"
    ]
   @intro_input = 0
  end    
  
  def inventory_options
    puts "Choose one option out of these: 1, 2, 3, 4, 5"
    i = 0
    while i < @options.length
     puts "#{i + 1}: " +  @options[i]
     i+=1
    end
  end
  def input
    print "Enter the choice: "
    @intro_input = gets.strip.to_i
    puts "--------------------------\n"
  end
end


# class Exit 
#   def initialize

#   end


# end

