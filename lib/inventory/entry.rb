require 'colorize'
class Intro
  attr_accessor :intro_message, :options, :intro_input
  def initialize
  @intro_message = "\n"\
"_ _ _ ____ _    ____ ____ _  _ ____    ___ ____      _ _  _ _  _ ____ _  _ ___ ____ ____ _   _    ____ ___  ___    /\n"\
"| | | |___ |    |    |  | |\\/| |___     |  |  |      | |\\ | |  | |___ |\\ |  |  |  | |__/  \\_/     |__| |__] |__]  /\n"\
"|_|_| |___ |___ |___ |__| |  | |___     |  |__|      | | \\|  \\/  |___ | \\|  |  |__| | \\    |      |  | |    |    .\n"\
"\n".light_blue
   @options = []
   @intro_input = 0
  end    
  
  def inventory_options
    puts "Choose one option out of the given below: 0, 1, 2 "
    @options << "Add sold units and update Current Inventory for the same day"
    @options << "Obtain reorder quantity"
    @options << "Calculate revenue for the same day"
    @options << "Add sold units and update inventory for the next day"
    i = 0
    while i < @options.length
     puts "#{i}. " +  @options[i]
     i+=1
    end
  end



end

