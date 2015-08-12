# Write your answer bellow
#
# Happy coding!!

class Person
	def initialize(firstname, lastname)
		@firstname = firstname
		@lastname = lastname
		@full_name = "#{@firstname} #{@lastname}"
	end

	attr_reader :firstname, :lastname, :full_name
end

class Player < Person
	def initialize(firstname, lastname, health=50, strength=5, alive=true)
		super(firstname,lastname)
		@health = health
		@strength = strength
		@alive = alive
	end

	attr_reader :strength

	attr_accessor :health, :alive

	def attack(player)
		puts "#{full_name} attacks #{player.full_name}"
		player.take_damage(self.strength)
	end

	protected
	def take_damage(attack_strength)
		self.health -= attack_strength if @health > 0
		self.alive = false if @health <= 0
		if self.alive==false
			puts "#{self.full_name} is dead."
		end
	end 
end

class Knight < Player
	def initialize(firstname, lastname, health=50, strength=7, alive=true)
		super(firstname,lastname,health,strength,alive)
	end
end

class Wizard < Player
	def initialize(firstname, lastname, health=20, strength=75, alive=true)
		super(firstname,lastname,health,strength,alive)
	end
end

kody=Wizard.new("Kody","Law")
jeff=Knight.new("Jeff","Wei")
terrence=Player.new("Terrence","Chan")
richard=Player.new("Richard","Chan")

def fight(player1,player2,player3,player4)
	playerArray = [player1,player2,player3,player4]
	while(playerArray.length > 1)
		for i in 0..playerArray.length-1
			playerAttacked=([*0..playerArray.length-1] - [i]).sample
			playerArray[i].attack(playerArray[playerAttacked])
		end
		playerArray.each do |x|
			playerArray.delete(x) if x.alive==false
		end
	end
	puts "Congratulations #{playerArray[0].full_name}, you win!"
end


fight(kody,jeff,terrence,richard)