class Player
	attr_accessor :name, :life_points
  
	def initialize(name)
		@name=name
		@life_points=10
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(damage)
		 @life_points = @life_points - damage
		if @life_points <= 0
			puts "#{@name} a été tué !!"
		end
	end 

	def compute_domage
		return rand(1..6)
	end

	def attaks(attaqué)
		endomagE=compute_domage
		attaqué.gets_damage(endomagE)
		print " #{name} lui inflige #{endomagE} points de domage"
	end
end
