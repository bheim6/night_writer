require 'pry'

class NightRead

  attr_reader :input

  def initialize(input)
    @input = input
    @library = {"a" => ["0.", "..", ".."], "b" => ["0.", "0.", ".."],
                "c" => ["00", "..", ".."], "d" => ["00", ".0", ".."],
                "e" => ["0.", ".0", ".."], "f" => ["00", "0.", ".."],
                "g" => ["00", "00", ".."], "h" => ["0.", "00", ".."],
                "i" => [".0", "0.", ".."], "j" => [".0", "00", ".."],
                "k" => ["0.", "..", "0."], "l" => ["0.", "0.", "0."],
                "m" => ["00", "..", "0."], "n" => ["00", ".0", "0."],
                "o" => ["0.", ".0", "0."], "p" => ["00", "0.", "0."],
                "q" => ["00", "00", "0."], "r" => ["0.", "00", "0."],
                "s" => [".0", "0.", "0."], "t" => [".0", "00", "0."],
                "u" => ["0.", "..", "00"], "v" => ["0.", "0.", "00"],
                "w" => [".0", "00", ".0"], "x" => ["00", "..", "00"],
                "y" => ["00", ".0", "00"], "z" => ["0.", ".0", "00"],
                "'" => ["..", "..", "0."], "," => ["..", "0.", ".."],
                "-" => ["..", "..", "00"], "." => ["..", "00", ".0"],
                " " => ["..", "..", ".."], "!" => ["..", "00", "0."],
                "?" => ["..", "0.", "00"],
                "A" => ["..0.", "....", ".0.."], "B" => ["..0.", "..0.", ".0.."],
                "C" => ["..00", "....", ".0.."], "D" => ["..00", "...0", ".0.."],
                "E" => ["..0.", "...0", ".0.."], "F" => ["..00", "..0.", ".0.."],
                "G" => ["..00", "..00", ".0.."], "H" => ["..0.", "..00", ".0.."],
                "I" => ["...0", "..0.", ".0.."], "J" => ["...0", "..00", ".0.."],
                "K" => ["..0.", "....", ".00."], "L" => ["..0.", "..0.", ".00."],
                "M" => ["..00", "....", ".00."], "N" => ["..00", "...0", ".00."],
                "O" => ["..0.", "...0", ".00."], "P" => ["..00", "..0.", ".00."],
                "Q" => ["..00", "..00", ".00."], "R" => ["..0.", "..00", ".00."],
                "S" => ["...0", "..0.", ".00."], "T" => ["...0", "..00", ".00."],
                "U" => ["..0.", "....", ".000"], "V" => ["..0.", "..0.", ".000"],
                "W" => ["...0", "..00", ".0.0"], "X" => ["..00", "....", ".000"],
                "Y" => ["..00", "...0", ".000"], "Z" => ["..0.", "...0", ".000"]}

      @new_library = @library.invert

  end


  def translate_to_english

    braille = input.split("\n")

    array_1 = braille[0]
    array_2 = braille[1]
    array_3 = braille[2]

    row_1 = array_1.scan(/../)
    row_2 = array_2.scan(/../)
    row_3 = array_3.scan(/../)



    letters = row_1.zip(row_2, row_3)

    capital = letters.include?(["..", "..", ".0"])



    # letters2 = letters.map do |letter|
    #   if letter == ["0.", "..", ".."]
    #     index = letters.index(letter)
    #   # else
    #   #   letters2 << letter
    #   # end
    #
    #   end

      # shift = ["..", "..", ".0"]


      # l_case_letter = letters[letters2 + 1]
      #
      # words = 3.times.map do |i|
      #   shift[i] + l_case_letter[i]
      #
      # end

      # binding.pry




    words = letters.map do |letter|
      @new_library[letter]
    end

    message = words.join
  end

end
