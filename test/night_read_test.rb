gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/night_read'

class TranslateTest < Minitest::Test

  def test_it_exists
    assert NightRead
  end

  def test_it_translates_a_braille_char
    reader = NightRead.new("0.\n..\n..")
    assert_equal "a", reader.translate_to_english
  end

  def test_it_translates_two_braille_chars
    reader = NightRead.new("0.0.\n..0.\n....")
    assert_equal "ab", reader.translate_to_english
  end

  def test_it_translates_with_a_space
    reader = NightRead.new("0...0.\n....0.\n......")
    assert_equal "a b", reader.translate_to_english
  end

  def test_it_translates_capital_braille_chars
    reader = NightRead.new("..0.\n....\n.0..")
    assert_equal "A", reader.translate_to_english
  end
end
