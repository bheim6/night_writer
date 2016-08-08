gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/night_reader'

class TranslateTest < Minitest::Test

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

  def test_it_can_convert_character_array_to_string_and_correctly_represent_hashtags
    reader1 = NightReader.new("0....00...\n.....0....\n....00....")
    reader2 = NightReader.new(".00.0...000.\n.0..0...00..\n00..........")

    assert_equal "a #a ", reader1.convert_message
    assert_equal "#ab ga", reader2.convert_message
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

  def test_it_can_format_a_braille_number
    reader = NightReader.new(".00...\n.0....\n00....")

    assert_equal "1", reader.translate_to_english
  end

  def test_it_can_format_a_braille_number_and_letter_with_space
    reader = NightReader.new("0....00...\n.....0....\n....00....")

    assert_equal "a 1", reader.translate_to_english
  end

  def test_it_can_format_a_braille_number_and_letter
    reader = NightReader.new(".00.0...000.\n.0..0...00..\n00..........")

    assert_equal "12ga", reader.translate_to_english
  end
end
