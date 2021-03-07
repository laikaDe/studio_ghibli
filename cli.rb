require 'pry'

class CLI

    attr_accessor :string, :film, :character

     #-------Strings-----------------------------------#
     @welcome = "♥ Welcome to the virtual studio ghibli museum!\n"
     @intro = "♥ Feel free to explore the different films displayed on the menu.\n"
     @welcome_prompt = "♥ Would you like to continue? Y/N?\n"
     @response_to_prompt = "♥ Excellent, have fun exploring!\n"
     @film_num_prompt = "♥ Pick the number of the film you would like more information on.\n"
     @y = "y".upcase
     @n = "n".upcase
     @goodbye_message = "That's too bad, bye Felicia! ♥"

    #-------------------------------------------------#

    def self.call 

        @welcome.print_slowly
        @intro.print_slowly
        input = @y

        while input == @y
            @welcome_prompt.print_slowly
            input = gets.chomp.upcase
            case input
            when @y
                @response_to_prompt.print_slowly
                @film_num_prompt.print_slowly
                Film.print_all_titles
                num = gets.chomp.to_i
                if num.between?(1, Film.all.count)
                    puts Film.all[num-1].print_film_info
                else
                    puts "Sorry that's not part of the list. Here's the list again.".print_slowly 
                    Film.print_all_titles
                end
            when @n 
                puts @goodbye_message 
                exit
            else 
                puts "Sorry that's not part of the list. Here's the list again.".print_slowly 
                Film.print_all_titles 
            end
        end
    end
end