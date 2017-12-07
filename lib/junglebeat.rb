require_relative 'linked_list'
require_relative 'node'

class JungleBeat < LinkedList
  attr_reader   :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    words = data.split(" ")
    words.map do |word|
      @list.append(word)
    end
    words.join(" ")
  end

  def count
    @list.count
  end

  def play
    `say "#{@list.to_string}"`
    return @list.to_string
  end

end

jb = JungleBeat.new
puts "What would you like me to play?"
user_song = gets.chomp.to_s
jb.append(user_song)
jb.play
