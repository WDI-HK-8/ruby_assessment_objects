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
    if attack_strength >= health
      @alive = false
      puts alive
      puts "You killed the motherfucker"
    else
      @health -= attack_strength
    end

  end

  def attack(player)
    if alive
      player.take_damage(strength)
    else
      puts "You're dead man. You can't attack."
    end
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

puts knight.attack(wizard)
puts wizard.attack(knight)

puts knight.attack(wizard)
puts knight.attack(wizard)


