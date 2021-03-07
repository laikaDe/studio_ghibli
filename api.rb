require 'httparty'
require 'pry'
require_relative './film'

class API
    def self.get_films(url)
        resp = HTTParty.get(url)
        resp.each do |hash|
            Film.new(
            hash['title'],
            hash['description'],
            hash['director'],
            hash['release_date'],
            hash['rt_score'],
            )
        end
    end
end

API.get_films('https://ghibliapi.herokuapp.com/films')