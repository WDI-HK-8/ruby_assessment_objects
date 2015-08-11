# Write your answer bellow
#
# Happy coding!!

class Person
  attr_accessor :first_name, :last_name, :full_name 
end

class Player < Person
  def initialize (health=20, strength=5, alive=true)
    @health = health
    @strength = strength
    @alive = alive
  end

  def take_damage(attack_strength)
    @health -= attack_strength
  end

  def attack(player)
    player.take_damage(@strength)
  end

end

class Knight < Player
  def initialize (health=50, strength=7)
    super(health, strength)
  end 
end

class Wizard < Player
  def initialize (health=20, strength=75)
    super(health, strength)
  end
end
