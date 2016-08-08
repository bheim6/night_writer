gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/translate'


class TranslateTest < Minitest::Test

  def test_it_can_modify_input_when_given_single_number
    translate = Translate.new("1")

    assert_equal "#1 ", translate.format_numbers
  end

  def test_it_can_modify_input_when_given_multiple_numbers
    translate = Translate.new("123")

    assert_equal "#123 ", translate.format_numbers
  end

  def test_it_can_modify_input_when_given_multiple_numbers_and_letters
    translate = Translate.new("word123 a6b")

    assert_equal "word#123  a#6 b", translate.format_numbers
  end

  def test_it_can_convert_letter_to_an_array_of_braille_chars
    translate = Translate.new("a")

    assert_equal ["0.", "..", ".."], translate.convert_to_rows
  end

  def test_it_can_convert_multiple_letters_to_an_array_of_braille_chars
    translate = Translate.new("ab")

    assert_equal ["0.0.", "..0.", "...."], translate.convert_to_rows
  end

  def test_it_can_convert_upper_case_letters_to_an_array_of_braille_chars
    translate = Translate.new("A")

    assert_equal ["..0.", "....", ".0.."], translate.convert_to_rows
  end

  def test_it_can_convert_a_single_number_to_an_array_of_braille_chars
    translate = Translate.new("1")

    assert_equal [".00...", ".0....", "00...."], translate.convert_to_rows
  end

  def test_it_can_convert_multiple_numbers_to_an_array_of_braille_chars
    translate = Translate.new("123")

    assert_equal [".00.0.00..", ".0..0.....", "00........"], translate.convert_to_rows
  end

  def test_it_can_convert_numbers_and_letters_to_an_array_of_braille_chars
    translate = Translate.new("12g")

    assert_equal [".00.0...00", ".0..0...00", "00........"], translate.convert_to_rows
  end

  def test_it_translates_a_lcase_letter
    translate = Translate.new("a")

    assert_equal "0.\n..\n..", translate.translate_to_braille
  end

  def test_it_translates_two_letters
    translate = Translate.new("ab")

    assert_equal "0.0.\n..0.\n....", translate.translate_to_braille
  end

  def test_it_translates_capital_letters
    translate = Translate.new("A")

    assert_equal "..0.\n....\n.0..", translate.translate_to_braille
  end

  def test_it_translates_sinlge_number
    translate = Translate.new("1")

    assert_equal ".00...\n.0....\n00....", translate.translate_to_braille
  end

  def test_it_translates_multiple_numbers
    translate = Translate.new("123")

    assert_equal ".00.0.00..\n.0..0.....\n00........", translate.translate_to_braille
  end

  def test_it_translates_letters_and_numbers
    translate = Translate.new("12g")

    assert_equal ".00.0...00\n.0..0...00\n00........", translate.translate_to_braille
  end

end
