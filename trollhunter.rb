
class Scene
  def enter()
  end
end

class Engine
  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('a_playagain')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
 end

 current_scene.enter()

  end
end

class Death < Scene

  @@quips = [
    "You got ripped into pieces by a giant Troll.",
     "You got eaten by a giant Troll",
     "You got killed by a giant Troll",
     "You became a dinner of a giant Troll."
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)

    return 'a_playagain'

  end
end

class Tavern < Scene
  def enter()
    puts "You're a brave knight coming back from a war in faraway land,"
    puts "the long journey made you exhausted."
    puts "As luck would have it, you're just passing by a small village with a tavern."
    puts "What do you do?"
    puts "a> Head to the tavern"
    puts "b> Continue your journey"

    action = $stdin.gets.chomp

    if action == "a"
    puts "Lured by the cosiness of the tavern you decide "
    puts  "to stop by to take some rest and have a pint of ale."
    puts ">"
    puts "From locals you learn that a terrible troll that inhabits nearby caves
     has been attacking the villagers for the past two weeks, and noone dares to face him.
     Anyone that kills the beast will be offered 1000 gold coins for reward."
     puts "As a respectable knight, without a second of hesitation you decide to undertake this quest"
     puts  "and help good people in their misery"

    return 'a_uppercaves'

  elsif action == "b"
    puts "You decide to keep moving, no time to waste."

    return 'a_campchoice'

  else
    puts "DOES NOT COMPUTE!"
    return 'a_tavern'
  end

  end
end

class CampChoice < Scene
  def enter()
    puts "It's getting dark"
    puts "Your vision\'s blurry, exhaustion makes it difficult to continue your journey."
    puts "You arrive at the small valley which seems like a good spot to set a camp for a night"
    puts "What do you do?"
    puts "a> Set a camp."
    puts "b> Continue your journey despite the exhaustion."

    action = $stdin.gets.chomp

    if action == "a"
      puts "The beast came for you at night, you had no chance to defend yourself..."
    return 'a_death'

  elsif action == "b"
    puts "After couple hours, you fell asleep on your horse's back,"
    puts "which made you an easy target for the beasts hiding in the dark..."
    return 'a_death'

  else
    puts "DOES NOT COMPUTE!"
    return 'a_campchoice'
  end
  end
end

class UpperCaves < Scene
  def enter()
    puts "You arrive at a small valley where the troll's cave is located."
    puts "So it begins. You light the torch and carefully enter the cave. "
    puts "The cave is filled with foul smell of mould and decay, you can notice"
    puts "huge foot-like prints leading deeper in to the cave complex."
    puts "However, you also came across tiny prints that follow the underground spring on the "
    puts "on the opposite side."
    puts ">"
    puts "What do you do?"
    puts "a> Descend to the deeper caves"
    puts "b> Follow the spring"

  action = $stdin.gets.chomp

    if action == "a"
      return 'a_lair1'
    elsif action == "b"
      return 'a_undergroundspring'
    else
      puts "DOES NOT COMPUTE"
      return 'a_uppercaves'

    end
  end
end

class UndergroundSpring
  def enter()
    puts "You enter a cavern with a spring in the central point."
    puts "You suddenly notice a quick movement in the further part of the cave."
    puts "It appears that the spring cavern is a home to a little goblin."
    puts "The goblin tells you that he has a chest with a magic sword that trolls"
    puts "are extremely afraid of. The first hero that find's the answer to goblin\'s riddle"
    puts "will be the one that gets the sword."
    puts "What do you do?"
    puts "a> Listen to the riddle and try to find the answer."
    puts "b> Don't bother with the riddle and go back to the upper caves"
    puts "c> Kill the goblin"

    action = $stdin.gets.chomp

    if action == "a"
      return 'a_riddle'
    elsif action == "b"
      puts "Goblin looks at you with dissappointment, and quickly jumps in to the darkness"
      return 'a_uppercaves'
    elsif action == "c"
      puts "You take out your axe and with one smooth slash cut the goblin in half."
      puts "The treasure is lost forever."
      puts "You proceed to the deeper caves..."
      return 'a_lair'
    else
      puts "DOES NOT COMPUTE!"
      return 'a_undergroundspring'
    end
  end
end

class Riddle < Scene
  def enter()
    puts "Excellent! Great choice indeed. The goblin giggles and jumps in excitement"
    puts ">"
    puts "Here we go! A princess is as old as the prince will be
   when the princess is twice as old as the prince was
   when the princess's age was half the sum of their present age.
   Which of the following, then, could be true?"
   puts "Remember hero, You have only one chance to guess!"
   puts ">"
   puts ">"

   puts "a> The prince is 20 and the princess is  30"
   puts "b> The prince is 40  and the princess is 30"
   puts "c> The prince is 30  and the princess is 40"
   puts "d> The prince is 30  and the princess is 20"
   puts "e> They're both the same age."
   puts "f> I have no idea."

   answer = $stdin.gets.chomp

   if answer == "c"
     puts "Excellent! Here is the sword good luck!"
     puts "Goblin disappears in the darkness"
     puts "The sword's blade shines with a golden aura"
     puts "Encouraged by the powerful artifact, you proceed to the deeper caves"

     return 'a_lair2'
   elsif answer == "f"
     puts "HAH! No sword for you then, silly!"
     puts "Goblin jumps into the stream, never to be seen again."
     puts "You proceed to deeper caves..."

     return 'a_lair1'
   else
     puts "Nice try, but this is not the answer I was waiting for dummy!"
     puts "Goblin jumps into the streem, never to be seen again."

     return 'a_lair1'
   end

  end
end

class Lair1 < Scene
  def enter()
    puts "As you descend deeper and deeper, the air is getting more dense"
    puts "After a while you enter a huge cavern filled with stench of rotten meat."
    puts "As the light of your torch shines upon the ground you can notice countless bones scattered"
    puts "all around the place. Finally you hear the sound of heavy foot steps"
    puts "and a huge, terrifying troll appears before you"
    puts "\"HERE COMES MY DINNER!\" the troll shouts and rushes at you "
    puts ">"
    puts "What do you do?"
    puts "a> Try to run away"
    puts "b> Take out your axe and fight"
    action = $stdin.gets.chomp

    if action == "a"
      puts "Unfortunately the troll runs faster than you..."
      return 'a_death'

    elsif action == "b"
      return 'a_axe'

    else
      puts "DOES NOT COMPUTE!"
      return 'a_lair1'

    end
  end
end

class Lair2 < Scene
  def enter()
    puts "As you descend deeper and deeper, the air is getting more dense"
    puts "After a while you enter a huge cavern filled with stench of mould and decay."
    puts "As the light of your torch shines upon the ground you can notice countless bones scattered"
    puts "all around the place. Finally you hear the sound of heavy foot steps"
    puts "and a huge, terrifying troll appears before you"
    puts "\"HERE COMES MY DINNER!\" the troll shouts and rushes at you "
    puts ">"
    puts "What do you do?"
    puts "a> Try to run away"
    puts "b> Take out your axe and fight"
    puts "c> Take out the magic sword and fight"

    action = $stdin.gets.chomp

    if action == "a"
      puts "Unfortunately the troll runs faster than you..."
      return 'a_death'

    elsif action == "b"
      return 'a_axe'

    elsif action == "c"
      return 'a_magicsword'

    else
      puts "DOES NOT COMPUTE!"
      return 'a_lair2'
    end

  end
end

class Finished < Scene
  def enter()
    puts "You return to the village in glory, you get your reward and leave."
    puts "Well done!"
    puts "You finished the game!"
    return 'a_playagain'

  end
end

class PlayAgain < Scene
  def enter()
    puts "Would you like to play again? (yes/no)"

    action = $stdin.gets.chomp

    if action == "yes"
      a_map = Map.new('a_tavern')
      a_game = Engine.new(a_map)
      a_game.play()
    elsif action == "no"
      exit
    else
      puts "DOES NOT COMPUTE!"
      return 'a_playagain'
    end
  end
end


class Axe < Scene

  def enter()

    lameslash = rand(1..10)

    if lameslash < 6
      puts "Troll grabbed your axe and threw it away, you're done."
      return 'a_death'
    elsif lameslash > 6
      puts "Your axe cuts deep into Troll's skull, killing him instantly. "
      return 'a_finished'
    else
      puts "error"

    end
    end
end

class MagicSword < Scene

  def enter()
    magicslash = rand(7..15)

    if magicslash < 8
      puts "Troll dodged your attack."
      return 'a_death'
    elsif magicslash >= 8
      puts "Your magic sword kills the giant Troll instantly."
      return 'a_finished'
    else
      puts "error"

    end
  end
end

class Map
  @@scenes = {
    'a_tavern' => Tavern.new(),
    'a_death' => Death.new(),
    'a_campchoice' => CampChoice.new(),
    'a_uppercaves' => UpperCaves.new(),
    'a_undergroundspring' => UndergroundSpring.new(),
    'a_riddle' => Riddle.new(),
    'a_lair1' => Lair1.new(),
    'a_lair2' => Lair2.new(),
    'a_axe' => Axe.new(),
    'a_magicsword' => MagicSword.new(),
    'a_finished' => Finished.new(),
    'a_playagain' => PlayAgain.new()
  }

  def initialize(start_scene)
  @start_scene = start_scene
end


def next_scene(scene_name)
  val = @@scenes[scene_name]
  return val
end

def opening_scene()
  return next_scene(@start_scene)
end
end

a_map = Map.new('a_tavern')
a_game = Engine.new(a_map)
a_game.play()
