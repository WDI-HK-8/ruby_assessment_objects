class Person
  attr_reader :first_name, :last_name, :full_name
  def initialize(first_name,last_name)
    @first_name = first_name
    @last_name = last_name
    @full_name = "#{first_name} #{last_name}"
  end
end

class Player < Person
  @@count = 0
  attr_accessor :health, :alive
  attr_reader :strength
  def initialize(first_name,last_name,health=20,strength=5,alive=true)
    super(first_name,last_name)
    @health = health
    @strength = strength
    @alive = alive
    @@count += 1
  end

  def take_damage(attack_strength)
    @health -= attack_strength
  end

  def attack(player)
    player.take_damage(strength)
  end

  def self.count
    @@count
  end
end

class Knight < Player
  def initialize(first_name,last_name,health=50,strength=7,alive=true)
    super(first_name,last_name,health,strength,alive)
  end
end

class Wizard < Player
  def initialize(first_name,last_name,health=20,strength=75,alive=true)
    super(first_name,last_name,health,strength,alive)
  end
end

class Game
  def initialize(player_count=2)
    @players = []
    @losers = []
    @player_count = player_count
    create_players()
  end

  def create_players
    count = 1
    @player_count.times {
      player = {title: "player#{count}"}
      puts "Player #{count}: Wizard or knight (w/k):"
      player[:type] = gets
      puts "Player #{count}: first name:"
      player[:first_name] = gets
      puts "Player #{count}: last name:"
      player[:last_name] = gets
      @players.push player
      count += 1
    }
    @players.each do |player|
      if player[:type] == "w\n"
        player[:type] = Wizard.new(player[:first_name],player[:last_name])
      else
        player[:type] = Knight.new(player[:first_name],player[:last_name])
      end
    end
  end

  def player_death(player,index)
    @losers.push player[:type].first_name
    @display.delete(player[:title])
  end

  def play
    @display = []
    @players.each do |player|
      @display.push player[:title]
    end
    puts "Players in game : #{@display.join(', ')}"
    count = 0
    while @display.length > 1 do
      count = 0 if count >= @display.length
      @players.each_index do |index|
        @ind = index if @players[index][:title] == @display[count]
      end
      player = @players[@ind]
      puts "#{player[:title]} select player to attack (by number):"
      defender_number = gets.to_i-1
      defender = @players[defender_number]
      player[:type].attack(defender[:type])
      player_death(@players[defender_number],defender_number) if @players[defender_number][:type].health <= 0
      puts "Players still in game: #{@display.join(', ')}"
      count += 1
    end
    puts "Congrats #{@display[0]}, you are the winner!"
    puts "The losers (from biggest to smallest), are: #{@losers.join(', ')}"
  end
end

puts "How many players:"
number = gets.to_i
game = Game.new(number)
game.play

