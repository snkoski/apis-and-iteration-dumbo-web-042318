require 'rest-client'
require 'json'
require 'pry'

def get_character(character)
  #make the web request, returns character hash
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  characters_hash = JSON.parse(all_characters)
  characters_hash["results"].find { |character_info| character_info["name"].downcase == character.downcase}
  # else
  #
  # end

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

def get_character_height(character_hash)
  puts character_hash["height"] + " inches"
end

def get_character_species(character_hash)
  hash = JSON.parse(RestClient.get(character_hash["species"][0]))
  puts "#{hash["designation"]} #{hash["name"].downcase}"
end

def parse_character_movies(character_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash = character_hash["films"].collect {|movie| RestClient.get(movie)}
  films_hash.each { |film| puts JSON.parse(film)["title"] }
end

def show_character_movies(character)
  character_hash = get_character(character)
  if character_hash == nil
    puts "Character not found"
    return
  else
    parse_character_movies(character_hash)
  end
end

def show_character_height(character)
  character_hash = get_character(character)
  get_character_height(character_hash)
end

def show_character_species(character)
  character_hash = get_character(character)
  get_character_species(character_hash)
end



def choose_method(input_array)
  if input_array[1].downcase == "height"
    show_character_height(input_array[0])
  elsif input_array[1].downcase == "films"
    show_character_movies(input_array[0])
  elsif input_array[1].downcase == "species"
    show_character_species(input_array[0])
  else
    puts "WTF mate"
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
