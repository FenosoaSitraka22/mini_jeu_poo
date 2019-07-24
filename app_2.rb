require 'bundler'
Bundler.require
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/humanplayer'
puts " ----------------------------------------------- "
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------- "

puts "Saisir le nom du player"
nom = gets.chomp
user = Humanplayer.new(nom)
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1,player2]

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  puts user.show_states
  if (user.life_points <= 0 || (player1.life_points <= 0 and player2.life_points <=0))
break
end
puts "Quelle action veux-tu effectuer ?"
puts "a - chercher une meilleure arme"
puts "s - chercher à se soigner "
puts "attaquer un joueur en vue :"

if (player1.life_points<=0 and player2.life_points!=0)
	puts "0 - José a #{player2.life_points} points de vie"
elsif (player1.life_points!=0 and player2.life_points<=0)
	puts "0 - Josiane a #{player1.life_points} points de vie"
else
	puts "0 - Josiane a #{player1.life_points} points de vie"
	puts "1 - José a #{player2.life_points} points de vie"
end


 
 
 choice = gets.chomp

	case choice
 		when "a"
 			user.search_weapon
		when "s"
 			user.search_health_pack
 		when "0"
 			user.attaks(player1)

 		when "1"
 			user.attaks(player2)
 		else
 			puts "vuiller taper l'un de ces caracteres suggerer en haut"
 		end
		if (player1.life_points<=0 && player2.life_points<=0)
 				break
 		end
 	puts "c'est au tour des enemies de riposter !!!"

 	enemies.each do |attaqueur|
 		next if (attaqueur.life_points <= 0)
 				attaqueur.attaks(user)
 		end

end

binding.pry