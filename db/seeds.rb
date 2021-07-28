# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

resp = HTTParty.get("https://pokeapi.co/api/v2/pokemon?limit=100000")
resp['results'].each_with_index do |pokeHash, index|
    pokemon = HTTParty.get(pokeHash["url"])
    pokemonHash = {
        name: pokemon['name'],
        height: pokemon['height'],
        weight: pokemon['weight'],
        front_default: pokemon['sprites']['other']['dream_world']['front_default'],
        pokemon_type: pokemon['types'][0]['type']['name']
    }

    Pokemon.create(pokemonHash)
    puts("ON POKEMON NUMBER ", index)
    system("clear")
end

puts ("CREATED ALL POKEMON")