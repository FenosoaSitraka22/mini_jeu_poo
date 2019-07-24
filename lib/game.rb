class Game
	attr_accessor :human_player, :enemies

	def initialize(name)
		@human_player=Humanplayer.new(name)
		a = Player.new("P1")
		b = Player.new("P2")
		c = Player.new("P3")
		d = Player.new("P4")
		@enemies=[a,b,c,d]
	end 

	def kill_player (tabplay,player)
		tabplay.each do |p|
			if player == p
				puts "oka"
				tabplay.delete(player)
			end
		end
	end

	def is_still_ongoing?
		if (@human_player.life_points>0 && @enemies[0]!=nil)
			return true
		else
			return false
		end
	end

	def show_players
		@human_player.show_states
		puts "enemies restant(s) #{@enemies.length}"
	end

	def menu
		 puts @human_player.show_states
		 puts "Quelle action veux-tu effectuer ?"
		 puts "a - chercher une meilleure arme"
 		 puts "s - chercher à se soigner "
		 puts "attaquer un joueur en vue :"
			i=0
 		 @enemies.each do |f|
		 	puts "#{i} - #{f.name} a #{f.life_points} points de vie"
		 	i +=1
 		 end
 	end 

 	def menu_choice(s)
 		case s
 		when "a"
 			@human_player.search_weapon
 		when "s"
 			@human_player.search_health_pack
 		when "0","1","2","3"
 						
 			@human_player.attaks(@enemies[s.to_i])
 			print "  #{@enemies[s.to_i].name} \n"
				if @enemies[s.to_i].life_points <= 0
 					kill_player(@enemies ,@enemies[s.to_i])
				end
 		else
 			puts "wrong choice"
 		end
 	end

 	def enemies_attak
 		@enemies.each do |current_enemies|
 			current_enemies.attaks(@human_player)
 			print "  #{@human_player.name} \n"
 		end
 	end

 	def end
 		if (@human_player.life_points<=0 )
 			puts "you're loser !!"
 			return false
 		elsif (@enemies.length == 0)
 			puts "you win !!"
 			return false
 		else
 			return true
 		end

 	end

end
