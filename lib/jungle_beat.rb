require_relative '../lib/node'
require_relative '../lib/list'

class JungleBeat
  attr_accessor :list

  def initialize(beats)
    @beats = beats
    split_beats = beats.split
    first_beat = split_beats[0]
    @list = List.new(first_beat)
    split_beats[1..-1].each do |beat|
      list.append(beat)
    end
  end

  def play
    `say -r #{@rate} -v Boing #{list.all}`
    list.count
  end

  def rate(speed = 200)
    @rate = speed
  end

  # def voice(v = "Boing")
  #   voices = ["Agnes", "Kathy", "Princess", "Vicki", "Victoria", "Alex", "Bruce", "Fred", "Junior", "Ralph", "Albert", "Bad News", "Bahh", "Bells", "Boing", "Bubbles", "Cellos", "Deranged", "Good News", "Hysterical Pipe Organ", "Trinoids", "Whisper", "Zarvox"]
  #   if voices.include?(v)
  #     @voice = v
  #   else
  #     "Pick another voice!"
  #   end
  # end

  def append(beats)
    if list == ""
      "You gotta create a new list homie! Initialize that ish!"
    else
      counter = 0
      split_beats = beats.split
      split_beats[0..-1].each do |beat|
        counter += 1
        list.append(beat)
      end
      counter
    end
  end

  def prepend(beats)
    counter = 0
    split_beats = beats.split
    split_beats[0..-1].each do |beat|
      counter += 1
      list.prepend(beat)
    end
    counter
  end

  def all
    list.all
  end

  def count
    list.count
  end

  def include?(beat)
    list.include?(beat)
  end

  def find(position, amount)
    if position > list.count || position + amount > list.count
      "NO! NO! NO!"
    else
      list.find(position, amount)
    end
  end

  def insert(position, data)
    if position > list.count
      "That spot doesn't exist silly!"
    else
      list.insert(position, data)
      list.all
    end
  end

  def pop(amount = 1)
    if amount >= list.count
      "You can't do that! You only have #{count} beats in here!"
    else
    list.pop(amount)
    end
  end
end
