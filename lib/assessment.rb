# Write your answer bellow
#
# Happy coding!!

class Person
  attr_accessor :first_name, :last_name

  def full_name
    "#{@first_name} #{@last_name}"
  end
  
  def info
    puts "-"*40
    puts full_name
  end
end

class Player < Person
  attr_accessor :health, :strength, :alive

  def initialize(health=20, strength=2, alive=true)
    @health   = health
    @strength = strength
    @alive    = alive
  end

  def attack(player)
    puts "#{full_name} attacks #{player.full_name}"
    player.take_damage(self.strength)
  end

  def info
    super
    puts "Health:   #{@health}"
    puts "Strength: #{@strength}"
    puts "Alive:    #{@alive}"
  end

  protected
  def take_damage(attack_strength)
    self.health -= attack_strength if @health > 0
    @alive = false if @health < 0
  end
end

class Knight < Player
  def initialize(health=50, strength=7, alive=true)
    super
    @health   = health
    @strength = strength
    @alive    = alive
  end
end

class Wizard < Player
  def initialize(health=20, strength=75, alive=true)
    @health   = health
    @strength = strength
    @alive    = alive
  end
end

harry = Knight.new
harry.first_name = "Harry"
harry.last_name  = "Chen"
harry.info  

fer   = Wizard.new
fer.first_name = "Fer"
fer.last_name  = "Martin"
fer.info

puts
puts "LET THE NERD BATTLE BEGIN"
puts
harry.attack(fer)
fer.info

fer.attack(harry)
harry.info  