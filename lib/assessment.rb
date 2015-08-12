# Write your answer below
#
# Happy coding!!

class Person 
  def initialize(first_name, last_name, full_name)
    @first_name = first_name
    @last_name  = last_name
    @full_name  = full_name
  end

  attr_accessor :first_name, :last_name, :full_name
end

class Player < Person
  def initialize(first_name, last_name, full_name)
    super
    @health   = 20
    @strength = 5
    @alive    = true
  end

  def take_damage(attack_strength)
    @attack_strength = attack_strength
    @health = @health - attack_strength
    puts "Oh no, you've taken a #{@health} hit to your armor! You're dying!"
    unless 
      @health <= 0
      @alive   = false
      puts "And... you're dead."
    end
  end

  def attack(player)
    @player = player 
    player.take_damage(strength)
    puts "Bim! Take that, butterface!"
  end
end

class Knight < Player
  def initialize(first_name, last_name, full_name)
    super
    @health   = 50
    @strength = 7
  end
end

class Wizard < Player
  def initialize(first_name, last_name, full_name)
    super
    @health   = 20
    @strength = 75
  end
end

player_1 = Player.new("Tom", "Cat", "Tom Cat")

player_2 = Wizard.new("Jerry", "Mouse", "Jerry Mouse")

player_3 = Knight.new("Spike", "Bulldog", "Spike Bulldog")


