# Write your answer bellow
# Medieval Objects 
# Happy coding!!


class Person

  attr_accessor :first_name, :last_name, :full_name 

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    full_name = "#{@first_name} #{@last_name}"
  end

end 


class Player < Person # a player class is a subclass of a person class

  @@count = 0
  attr_accessor :health, :alive
  attr_reader :strength

  def initialize(first_name, last_name, health = 20, strength = 5, alive = true)
   super(first_name,last_name)
    @health   = health
    @strength = strength
    @alive    = alive
    @@count  += 1 
  end

  def take_damage(attacker)
    
    @health -= attacker.strength if attacker.alive
    puts "You have #{@health} health left"


      @alive = false if (attacker.strength >= @health)
      puts "Your character is dead"
    end


  def attack(target)
 
    target.health -= @strength if @alive && target.alive
    puts "#{target.full_name}'s health left #{target.health}"
    
    target.alive = false if @strength >= target.health
    puts "#{target.full_name} is dead"
  end
end

#   def take_damage(attack_strength)
#    @health -= attack_strength
#   end
# end

#   def attack(player)
#     player.take_damage(strength)
#   end

#   def self.count
#     @@count
#   end
# end

class Knight < Player
  def initialize(first_name, last_name, health = 50, strength = 7, alive = true)
    super(first_name, last_name, health, strength, alive)
  end
end

class Wizard < Player
  def initialize(first_name, last_name, health = 20, strength = 75, alive = true)
    super(first_name, last_name, health, strength, alive)
  end
end

def player_status(player)
  puts player.full_name
  puts player.strength
  puts player.health
  puts player.alive
end

player = Player.new('john','doe')
knight = Knight.new('king','arthur')
wizard = Wizard.new('grey','beard')


