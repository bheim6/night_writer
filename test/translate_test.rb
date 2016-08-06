gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/translate'


class TranslateTest < Minitest::Test

  def test_it_exists
      assert Translate
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
end
