require 'colorize'
require 'tty-box'

class Intro
  attr_reader  :intro_message, :intro_description, :intro_input
  def initialize
    @intro_message = "\n"\
  "_ _  _ _  _ ____ _  _ ___ ____ ____ _   _    ____ ___  ___\n"\
  "| |\\ | |  | |___ |\\ |  |  |  | |__/  \\_/     |__| |__] |__] \n"\
  "| | \\|  \\/  |___ | \\|  |  |__| |  \\   |      |  | |    | \n"    
                                                            

    
   @intro_description = "\n"\
    "Hi, there! Welcome to the Inventory app!
This app will help an owner of a small Gift shop to manage his inventory stock,
display stock list, update inventory, calculate sales and many other helpful tasks.\n"\
"-------------------------------------------------------------------------------------\n"
    @options = [
     "Display Inventory Stock", "Add Sold units & Update Quantity",  
     "Replenish low stock",
     "Sales & Cumulative Sales", "Top selling product",
     "Exit the app"
    ]
    @intro_input = 0
  end    
  
  def inventory_options
    puts "Choose One Option out of these:".blue
    i = 0
    while i < @options.length
     puts "#{i + 1}: ".light_magenta +  @options[i].yellow
    #  puts "\n"
     i+=1
    end
  end
  def input
    print "Enter the choice: ".blue
    @intro_input = gets.strip.to_i
  end
end



