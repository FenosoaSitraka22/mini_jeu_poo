class Humanplayer < Player
	attr_accessor :weapon_level
	def initialize(name)
		@weapon_level = 1
		@life_points = 100
		@name = name
	end

	def show_states
		puts "#{@name} a #{@life_points} points de vie et et une arme de nieau #{@weapon_level}"
	end

	def compute_domage
		return rand(1..6)*@weapon_level
	end

	def gets_damage(damage)
		 super
		 @life_points = @life_points - damage
		if @life_points <= 0
			puts "#{@name} a été tué !!"
		end
	end 

	def search_weapon
		weapon_level2 = rand(1..6)
		puts "you find a weapon with level #{weapon_level2}"
		if weapon_level2 <= @weapon_level
			puts "bdm!!  elle n 'est pas mieux que ton arme actuelle.."
		else 
			puts "Youhou ! elle est meilleure que ton arme actuelle "
			@weapon_level = weapon_level2
		end

	end

	def search_health_pack

		vie = rand(1..6)
		if vie == 1
			puts "Tu n'as rien trouvé.."	
		elsif vie >= 2 && vie <= 5
				if @life_points + 50 >100
					@life_points = 100
				else
					@life_points += 50
				end
				puts "youuupi!! you win 50 life_points"
		else 
				if @life_points + 80 >100
					@life_points = 100
				else
					@life_points += 80
				end
				puts "youuupi!! you win 80 life_points"
		end
	end




end