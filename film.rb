
class Film 

    attr_accessor :director, :title, :description, :release_date, :rt_score
    
    @@all = []

    def initialize(title, description, director, release_date, rt_score)
        @title = title 
        @description = description
        @director = director
        @release_date = release_date
        @rt_score = rt_score
        @@all << self
    end

    def self.all
        @@all
    end

    def self.print_all_titles
        num = 1
        @@all.each do |film|
            puts "#{num}. #{film.title}"
            num += 1
        end 
    end

    def print_film_info
        puts "▬▬ #{self.title} ▬▬"
        puts "→ Director: #{self.director}"
        puts "→ Release Date: #{self.release_date}"
        puts "→ Description: #{self.description}"
        puts "→ Rating: #{self.rt_score}"
        puts "→ Release Date: #{self.release_date}"
    end
end