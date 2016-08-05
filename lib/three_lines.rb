class ThreeLines

  def initialize(word)
    @word = word
  end

  def change_to_three
     "#{@word}\n#{@word}\n#{@word}"
  end

end
