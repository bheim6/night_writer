gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/night_reader'

class TranslateTest < Minitest::Test

  def test_it_exists
    assert NightReader
  end

  def test_it_can_convert_single_braille_letter_to_an_array_of_character_arrays
    reader = NightReader.new("0.\n..\n..")

    assert_equal [["0.", "..", ".."]], reader.convert_to_characters
  end

  def test_it_can_convert_two_braille_letters_to_an_array_of_character_arrays
    reader = NightReader.new("0.0.\n..0.\n....")

    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."]], reader.convert_to_characters
  end

  def test_it_can_convert_braille_letters_with_a_space_to_an_array_of_character_arrays
    reader = NightReader.new("0...0.\n....0.\n......")

    assert_equal [["0.", "..", ".."], ["..", "..", ".."], ["0.", "0.", ".."]], reader.convert_to_characters
  end

  def test_it_can_convert_upper_case_braille_letters_to_an_array_of_character_arrays
    reader = NightReader.new("..0.\n....\n.0..")

    assert_equal [["..", "..", ".0"], ["0.", "..", ".."]], reader.convert_to_characters
  end

  def test_it_translates_a_braille_char
    reader = NightReader.new("0.\n..\n..")

    assert_equal "a", reader.translate_to_english
  end

  def test_it_translates_two_braille_chars
    reader = NightReader.new("0.0.\n..0.\n....")

    assert_equal "ab", reader.translate_to_english
  end

  def test_it_translates_with_a_space
    reader = NightReader.new("0...0.\n....0.\n......")

    assert_equal "a b", reader.translate_to_english
  end

  def test_it_translates_capital_braille_chars
    reader = NightReader.new("..0.\n....\n.0..")

    assert_equal "A", reader.translate_to_english
  end
end
