require 'httparty'
require 'pry'
require_relative './film'

class API
    def self.get_films(url)
        resp = HTTParty.get(url)
        resp.each do |hash|
            Film.new(
            hash['title'],
            hash['director'],
            hash['description'],
            hash['release_date'],
            hash['rt_score'],
            hash['running_time']
            )
        end  
    end
end

API.get_films('https://ghibliapi.herokuapp.com/films')