# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

league = League.create!(name: "Ping Pong League")

rafael = Player.create!(name:"Rafael")
ernesto = Player.create!(name:"Ernesto")
salazar = Player.create!(name:"Salazar")
darren = Player.create!(name:"Darren")
grady = Player.create!(name:"Grady")

LeaguePlayer.create!(player:rafael,league:league,score:1000)
LeaguePlayer.create!(player:ernesto,league:league,score:1000)
LeaguePlayer.create!(player:salazar,league:league,score:1000)
LeaguePlayer.create!(player:darren,league:league,score:1000)
LeaguePlayer.create!(player:grady,league:league,score:1000)
