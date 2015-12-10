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
    `say -r 150 -v Boing #{list.all}`
    puts list.count
  end

  def append(beats)
    split_beats = beats.split
    split_beats[0..-1].each do |beat|
      list.append(beat)
    end
  end

  def prepend(beats)
    list.prepend(beats)
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
    list.find(position, amount)
  end

  def insert(position, data)
    list.insert(position, data)
  end

  def pop(amount = 1)
    list.pop(amount)
  end
end


jb = JungleBeat.new("I love Alli so very much")
jb.play
puts jb.all
puts jb.count
puts jb.pop
