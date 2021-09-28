require 'colorize'
require 'tty-box'

class Intro
  attr_accessor :intro_description, :intro_message, :options, :intro_input
  def initialize
    @intro_message = "\n"\
  "_ _  _ _  _ ____ _  _ ___ ____ ____ _   _    ____ ___  ___\n"\
  "| |\\ | |  | |___ |\\ |  |  |  | |__/  \\_/     |__| |__] |__] \n"\
  "| | \\|  \\/  |___ | \\|  |  |__| |  \\   |      |  | |    | \n"    
                                                            

    
   @intro_description = "\n"\
    "Hi, there! Welcome to the Inventory app!
This app will help an owner of a small Gift shop to manage his inventory stock,
display stock list, update inventory, get sales report and many other helpful tasks.\n"\
"-------------------------------------------------------------------------------------\n"
    @options = [
     "Display Inventory Stock", "Add Sold units & Update Stock",  
     "Replenish low stock", "Regularly Update Inventory(Analysis)",
     "Calculate Sales", "Exit the app"
    ]
   @intro_input = 0
  end    
  
  def inventory_options
    puts "Choose One Option out of these: 1, 2, 3, 4, 5".blue
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


# class Exit 
#   def initialize

#   end


# end

