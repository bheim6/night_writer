class ThreeLines

  def initialize(word)
    @word = word
  end

  def change_to_three
     "#{@word}\n#{@word}\n#{@word}"
  end

end



newword = ThreeLines.new("Bob")
puts newword.change_to_three

# class Braille
#   def initialize(letter)
#     @letter = letter
#   end
#
#
#   def translate
#     if @letter == "a"
#       print "0.\n..\n.."
#     elsif @letter == "b"
#       print "0.\n0.\n.."
#     end
#   end
# end
#
# new_letter = Braille.new("a")
# new_letter1 = Braille.new("b")
#
# puts new_letter.translate
# puts new_letter1.translate
