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
			playerArray[playerAttacked].health -= playerArray[i].strength
			puts "#{playerArray[i].full_name} attacked #{playerArray[playerAttacked].full_name} for #{playerArray[i].strength} damage."
			if (playerArray[playerAttacked].health<=0)
				playerArray[playerAttacked].alive = false
				puts "#{playerArray[playerAttacked].full_name} is dead."
			end
		end
		for j in 0..playerArray.length-1
		    if (playerArray[j].alive==false)
		        puts "#{playerArray[j].full_name} is removed."
		        playerArray.delete(playerArray[j])
		    end
		end
	end
	puts "Congratulations #{playerArray[0].full_name}, you win!"
end


fight(kody,jeff,terrence,richard)