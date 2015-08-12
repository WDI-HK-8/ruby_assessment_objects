# Write your answer bellow
#
# Happy coding!!

class Person 
  def initialize(first_name='Sir Leeroy', last_name='Jenkins', full_name='Sir Leeroy Jenkins')
    @first_name = first_name
    @last_name  = last_name
    @full_name  = "#{@first_name} #{@last_name}"
  end

  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :full_name
end

#Player class inheriting from Person class
class Player < Person
  def initialize(health=20, strength=5, alive=true)
    @health   = health
    @strength = strength
    @alive    = alive
  end

  def take_damage(attack_strength)
    #subtract recievers health by attack_strength
    @health -= attack_strength
    puts "#{@full_name}'s taken #{attack_strength} damage"
    puts "#{@full_name}'s remaining health is #{@health}"
    return "#{@full_name} has died at #{@health} health" if @health <=0
    puts '-'*50
  end

  def attack(target)
    puts '-'*50+"#{@full_name}'s turn" 
    puts "#{self.full_name} is attacking!"
    @target = target
    @target.take_damage(@strength)
  end
end

class Knight < Player
  def initialize(health=50, strength=7)
    @health   = health
    @strength = strength
  end

  #instance attr
  attr_accessor :health
  attr_accessor :strength
end

class Wizard < Player
  # protected
  def initialize(health=20, strength=75)
    @health   = health
    @strength = strength
  end

  #instance attr
  attr_accessor :health
  attr_accessor :strength
end

#Instantiate the players, wizard and knight
wizard = Wizard.new()
knight = Knight.new() #set names - try to access the superclass Person's init 

#IMPROVE THIS 
knight.first_name = 'foo'
knight.last_name  = 'bar'
knight.full_name = 'knight foo bar'

wizard.first_name = 'bar'
wizard.last_name = 'bar'
wizard.full_name = 'wiz bar foo'

#defense
# knight.take_damage(wizard.strength)

#offense
# knight.attack(wizard)

#function to handle single fight exchange
def fight_exchange(player1, player2)
  #see who gets the advantage
  randomizer = rand
  player1.attack(player2) if rand      >= 0.5
  player2.attack(player1) if randomizer < 0.5
end

def to_the_death(player1, player2)
  while player1.health > 0 && player2.health > 0
    fight_exchange(player1, player2)
  end
end

to_the_death(knight, wizard)