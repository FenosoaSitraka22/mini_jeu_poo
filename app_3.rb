require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/humanplayer'


puts " ----------------------------------------------- "
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------- "
a=true
puts "Saisir le nom du player"
nom = gets.chomp
my_game= Game.new(nom)
while (a)
	
	my_game.menu
	gets_chomp = gets.chomp
	my_game.menu_choice(gets_chomp)
	my_game.enemies_attak
	a = my_game.end

end
binding.pry