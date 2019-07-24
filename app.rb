require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

player1 = Player.new('Sitraka')
player2 = Player.new('Tota')
while (player1.life_points > 0 && player2.life_points > 0)
puts "players states :"
 player1.show_state
 player2.show_state

puts "passons à phase d'attaque:"

	puts "#{player1.name} attaque #{player2.name}"
	player1.attaks(player2)
if (player2.life_points <= 0)
	#break
end
puts "#{player2.name} attaque #{player1.name}"
player2.attaks(player1)

puts "---------------------------------"

end 
if player1.life_points <= 0
	puts "#{player2.name} a gagné"
else
	puts "#{player1.name} a gagné"
end
binding.pry
puts 'end of test'