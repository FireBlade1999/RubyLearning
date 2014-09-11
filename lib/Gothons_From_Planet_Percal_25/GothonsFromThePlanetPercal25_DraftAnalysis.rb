

class Scene
  
  def enter()
    puts "Not yet impemented"
    exit(1)
  end
end

class Engine
  
  def initialize(scene_map)
    @scene_map = scene_map
  end
  
  def play()
    puts "Playing scene: #{@scene_map.opening_scene()}"
    current_scene = @scene_map.opening_scene()
    
    # Get the next scene from the current one
    # Make 'current_scene' equal to that next scene
    # loop until stopped
    loop do
      puts "current scene #{current_scene}"
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.get_scene(next_scene_name)
    end
  end
end

class Death < Scene
  
  def enter()
    puts "I'm sorry, you're dead"
    exit(1)
  end
end

class CentralCorridor < Scene
  
  def enter()
    puts "The Gothons of Planet Percal 25 have invaded your
    ship and destroyed "
    puts "your entire crew. You are the last survivorr and your "
    puts "last mission is to get the neutron destruct bomb from "
    puts "the weapon armory, put it in the bridge, and blow the "
    puts "ship up after getting into an escape pod. "
    puts "\n"
    puts "You're running down the central corridor to the weapons "
    puts "armory when, a Gothon jumps out, red scaly skin, dark grimy "
    puts "teeth, and evil clown costume. He's blocking the door to the "
    puts "armory and about to pull a weapon to blast you."
    print "> "
    
    action = $stdin.gets.chomp
    
    if action == "shoot!"
      puts "quick on the draw, you yank your blaster and fire it at the Gothon"
      puts "His clown costume is flowing and moving around his body which puts "
      puts "you off your aim. Your laser hits his costume but misses him entirely."
      puts "This completely ruins his new costume his mother bought him, which makes "
      puts "him very angry, so he kills you"
      return 'death'
    end
    if action == "dodge!"
      puts "you die"
      return 'death'
    end
    if action == "tell a joke!"
      puts "well done"
      return "laser_weapon_armory"
    end
        
      puts "WHAT?"
      return 'central_corridor'
  end
end

class LaserWeaponArmory < Scene
  
  def enter()
    puts "You've entered the laser weapon armory"
    puts "Get the bomb. The code is 3 digits"
    
    code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
    puts "code is #{code}"
    print "[keypad]> "
    guess = $stdin.gets.chomp
    puts "guess was #{guess}"
    guesses = 0
    
    if guess == code
        puts "place the bomb on the bridge"
        return 'the_bridge'
    else
      begin
        puts "BZZZED!!"
        guesses += 1
        puts "You've had #{guesses} guesses..."
        print "[keypad]> "
        guess = $stdin.gets.chomp

        if guess == code
          puts "place the bomb on the bridge"
          return 'the_bridge'
        end
      end while guess != code
    end
    
    puts "Too many wrong guesses pal.."
    return 'death'
end
end

class TheBridge < Scene
  
  def enter()
    puts "You've entered the bridge"
    print "> "
    
    action = $stdin.gets.chomp
    
    if action == "throw the bomb"
      puts "idiot"
      return 'death'
    end
    if action == "carefully place the bomb"
      puts "get off this tin can!"
      return 'escape_pod'
    end

    puts "WHAT?!"
    return 'the_bridge'
  end
end

class EscapePod < Scene
  
  def enter()
    puts "You've entered the escape pod"
    puts "There are 5 pods, which one is the only one not damaged?"
    
    good_pod = rand(1..5)
    print "[pod #]> "
    puts "good pod #{good_pod}"
    
    guess = $stdin.gets.chomp.to_i
    
    if guess != good_pod
      puts "Wrong"
      return 'death'
    else
      puts "You're outta here!"
      exit(1)
    end
  end
end

class Map
  
  #  hashmap of available scenes - apparently they have two @ symbols for some reason
  @@scenes = {
    'central_corridor' => CentralCorridor.new(),
    'laser_weapon_armory' => LaserWeaponArmory.new(),
    'the_bridge' => TheBridge.new(),
    'escape_pod' => EscapePod.new(),
    'death' => Death.new()
  }
  
  # initialize this map with a start scene
  def initialize(start_scene)
    @start_scene = start_scene
  end
  
  # get and return the scene
  def get_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end
  
  # return the opening scene
  def opening_scene()
    return get_scene(@start_scene)
  end
  
  
  a_map = Map.new('central_corridor')
  a_game = Engine.new(a_map)
  a_game.play()
end