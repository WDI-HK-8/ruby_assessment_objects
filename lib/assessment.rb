class Person
  
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @full_name  = "#{first_name} #{last_name}"
  end
  
  attr_accessor :first_name,:last_name,:full_name

end

class Player < Person

  def initialize(first_name, last_name, health = 20, strength = 5, alive = true)
    super(first_name, last_name)
    @health   = health
    @strength = strength
    @alive    = alive
  end

  def take_damage(attack_strength)
    @health -= attack_strength
  end

  def attack(player)
    player.take_damage(strength)
  end

  attr_accessor :health,:alive
  attr_reader :strength

end

class Knight < Player

  def initialize(first_name, last_name, health = 50, strength = 7)
    super(first_name, last_name)
    @health = health
    @strength = strength
  end

end

class Wizard < Player

  def initialize(first_name, last_name, health = 20, strength = 75)
    super(first_name, last_name)
    @health = health
    @strength = strength
  end
  
end

knight = Knight.new("Yohan","Sihou")
wizard = Wizard.new("Richie","Bostock")


