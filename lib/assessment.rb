class Person
  attr_accessor :first_name, :last_name
  def initialize(first, last)
    @first_name = first
    @last_name = last
    @full_name = first + ' ' + last
  end
end

class Player < Person
  attr_accessor :health, :strength, :alive
  def initialize(first, last, health=20, strength=5, alive=true)
    super(first, last)
    @health = health
    @@strength = strength
    @alive = alive
  end

  def print_player
    puts @full_name
    puts @health
    puts @strength
    puts @alive
  end

  def take_damage(attack_strength)
    if @health > 0
    @health -= @attack_strength 
    else
    @alive = false 
    end
  end

  def attack(player)
    player.take_damage(@attack_strength)
  end
end


class Knight < Player
  def initialize (first, last)
    super(first, last)
    @health = 50
    @strength = 7
  end

  def print_knight
    puts "#{@full_name}'s health is #{@health}"
    puts "Is #{@full_name} alive?: #{@alive}"
  end
end

lance = Knight.new("Lance", "a Lot")


class Wizard < Player
  def initialize (first, last)
    super(first, last)
    @health = 20
    @strength = 75
  end

  def print_wizard
    puts "#{@full_name}'s health is #{@health}"
    puts "Is #{@full_name} alive?: #{@alive}"
  end

end

richie = Player.new("Richie", "Bostock")
merlin = Wizard.new("Merlin", "the Beard")


if rand.round == 0
  puts "Lancealot is attacking Merlin!"
  lance.attack(merlin)
else
  puts "Merlin is attacking Lancealot!"
  merlin.attack(lance)
end

lance.print_knight
merlin.print_wizard  
