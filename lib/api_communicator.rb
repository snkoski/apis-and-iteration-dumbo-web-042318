require 'rest-client'
require 'json'
require 'pry-nav'

def merge_pages
  characters_hash = []
  1.upto(9) do |i|
    binding.pry
    var = JSON.parse(RestClient.get("https://swapi.co/api/people/?page=#{i}"))["results"]
  end
end

def get_character_movies_from_api(character)
  #make the web request
  found_character = nil
  1.upto(9) do |i|
    all_characters = RestClient.get("http://www.swapi.co/api/people/?page=#{i}")

    character_hash = JSON.parse(all_characters)
    character_hash["results"].each do |character_info|
      if character_info["name"].downcase == character.downcase
        found_character = character_info
        #binding.pry
      end
    end
  end
  #binding.pry
  found_character["films"].collect do |movie|
    RestClient.get(movie)
  end


  #BAD STUFF WE DID EARLIER
  #movies = nil
  # character_hash["results"].each do |character_info|
  #   if character_info["name"].downcase == character.downcase
  #     movies = character_info["films"]
  #   end
  # end
  # movies.collect do |movie|
  #   RestClient.get(movie)
  # end


  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |film|
    puts JSON.parse(film)["title"]
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  if films_hash == nil
    puts "Character not found"
    return
  else
    parse_character_movies(films_hash)
  end
end


#get_character_movies_from_api("han solo")
#show_character_movies("luke skywalker")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
