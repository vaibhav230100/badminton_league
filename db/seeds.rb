Match.destroy_all
Player.destroy_all
players = %w[Vaibhav Shivani Yashvik Ram Honey Chiku]

#================Player
players.each { |name| Player.create!(name: name) }
vaibhav = Player.find_by(name: "Vaibhav")
shivani = Player.find_by(name: "Shivani")
yashvik = Player.find_by(name: "Yashvik")
ram     = Player.find_by(name: "Ram")
honey   = Player.find_by(name: "Honey")
chiku   = Player.find_by(name: "Chiku")

#================Match

Match.create!(player_one: vaibhav, player_two: shivani, winner: vaibhav)
Match.create!(player_one: yashvik, player_two: ram, winner: yashvik)
Match.create!(player_one: honey,   player_two: chiku, winner: chiku)
Match.create!(player_one: ram,     player_two: vaibhav, winner: vaibhav)
Match.create!(player_one: honey,   player_two: shivani, winner: honey)
Match.create!(player_one: chiku,   player_two: yashvik, winner: yashvik)
Match.create!(player_one: vaibhav, player_two: chiku, winner: chiku)
Match.create!(player_one: ram,     player_two: honey, winner: honey)
