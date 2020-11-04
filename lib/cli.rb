class CLI
  
  def start
    puts "Welcome."
    API.fetch_lipstick
    self.list
  end
  
  def list
    # give user option to see list of Cover Girl lipsticks
    puts "Would you like to see the list of Cover Girl lipsticks?"
    puts "Type ' y' for yes to continue. Or press any another key to exit."
    
    user_input = gets.strip.downcase
    
    # if user says yes
    if user_input == "y"
      puts "\n"
      puts "Excellent!"
      # display the list of lipstick names
      list_of_covergirl_lipsticks
      ask_user_for_lipstick_choice
      
      sleep(2)
      puts "\n"
      
      list
    else
      puts "Goodbye."
    end
    
  end
  
  def list_of_covergirl_lipsticks
    # binding.pry
    Makeup.all.each do |lipstick|
      puts lipstick.name
    end
  end
  
  def ask_user_for_lipstick_choice
    # ask user for choice
    puts "Enter the number of the lipstick you'd like to know more about."
    index = gets.strip.to_i - 1
    
    # index valid? number between 0 and 6
    until index.between?(0, Makeup.all.length - 1)
      # keep asking for user input
      puts "Sorry, invalid input. Choose a valid number."
      index = gets.strip.to_i - 1
    end
    
    lipstick_instance = Makeup.all[index]
    
    display_lipstick_details(lipstick_instance)
    
    
  end
  
  def display_lipstick_details(lipstick)
    sleep(1)
    puts "\n"
    puts "Name: " + lipstick.name
    puts "Product Type: " + lipstick.product_type
    puts "Description: " + lipstick.description
  end
  
end