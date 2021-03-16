require 'pry'

class CLI

    def call
        @y = "y".upcase
        @n = "n".upcase
        print_start
        input = @y
        while input == @y
            print_continue
            input = gets.chomp.upcase
            case input
            when @y
                print_response
                display_film_info
                time_constraint
            when @n 
                goodbye
            else 
                restart
            end
        end
    end

    def print_start
        "♥ Welcome to the virtual studio ghibli museum!\n".print_slowly
        "♥ Feel free to explore the different films displayed on the menu.\n".print_slowly
    end

    def print_continue
        "♥ Would you like to continue? Y/N?\n".print_slowly
    end

    def menu
        Film.print_all_titles
    end

    def check_user_input_with_film_run_time
        input = gets.chomp.to_i
        num = 1 
        Film.all.each do |element|
            if element.running_time.to_i < input
                puts "#{num}. #{element.title} is #{element.running_time} minutes long.".print_slowly
                num += 1
            else 
                puts "♥ Sorry there are no films that meet this criteria. Please try again.".print_slowly
                time_restraint
            end
         end
    end

    def time_constraint

        puts "♥ Would you like a list of films based on how much time you have to watch it? Y/N?\n".print_slowly
        input = gets.chomp.upcase
        case input
        when @y 
            puts "♥ Okay, how many minutes do you have?".print_slowly
            check_user_input_with_film_run_time
        when @n 
            goodbye
        else 
            restart
        end
    end

    def display_film_info
        num = 0
        while !num.between?(1, Film.all.count)
            Film.print_all_titles
            num = gets.chomp.to_i
            if num.between?(1, Film.all.count)
                puts Film.all[num-1].print_film_info
                break
            else
                error_reprint_list
            end
        end  
    end

    def print_response
        "♥ Excellent!\n".print_slowly
        "♥ Pick the number of the film, you would like to see more information on.\n".print_slowly
    end
    
    def error_reprint_list 
        "♥ Sorry that's not part of the list. Here's the list again.\n".print_slowly
        menu
    end

    def restart
        "♥ Sorry I don't know what you mean. Start from the beginning? Y/N?\n".print_slowly 
        input = gets.chomp.upcase
        case input 
        when @y
            start
        when @n 
            goodbye
        else
            restart
        end
    end

    def goodbye 
        puts "That's too bad, bye Felicia! ♥".print_slowly
        exit
    end
end