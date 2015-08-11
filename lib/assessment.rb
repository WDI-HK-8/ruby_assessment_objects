class Person 
  def initialize(first_name,last_name)
    @first_name = first_name
    @last_name = last_name
  end
  attr_accessor :first_name, :last_name

  def full_name
    full_name = "#{@first_name} #{@last_name}"
  end
end

class Player < Person
  def initialize(first_name,last_name,health=20,strength=5,alive=true)
    super(first_name,last_name)
    @health = health
    @strength = strength
    @alive = alive
  end

  attr_reader :strength
  attr_accessor :alive, :health
  
  def take_damage(attacker)
    if attacker.alive
      @health -= attacker.strength
      puts "You have #{@health} health left"
      if (attacker.strength >= @health)
        @alive = false
        puts "You are cold cold dead"
      end
    else
      puts "You are dead man! Youu cannot attack"
    end
  end
  
  def attack(target)
    if (@alive && target.alive) 
      target.health -= @strength
      puts "#{target.full_name}'s health left #{target.health}"
      if (@strength >= target.health)
        target.alive = false
        puts "#{target.full_name} is deaaad"
      end
    else
      puts "This guy is dead, no need to hit him anymore..."
    end
  end

end

class Knight < Player
  def initialize(first_name,last_name,health=50,strength=7)
    super(first_name,last_name)
    @health = health
    @strength = strength
  end
end

class Wizard < Player
  def initialize(first_name,last_name,health=20,strength=75)
    super(first_name,last_name)
    @health = health
    @strength = strength
  end
end

def display_spec(player)
  puts player.full_name
  puts player.strength
  puts player.health
  puts player.alive
end

player = Player.new('Raphael','Dieu')
knight = Knight.new('Bruce','Wayne')
wizard = Wizard.new('Gandalf','TheGrey')











