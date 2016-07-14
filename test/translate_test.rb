gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require './lib/night_write'
require './lib/translate'


class TranslateTest < Minitest::Test

  def test_it_exists
      assert Translate
  end

  def test_it_translates_a_lcase_letter
    writer = NightWrite.new
    translate = Translate.new("a")
    assert_equal "0.\n..\n..", translate.translate_to_braille
  end

  def test_it_translates_two_letters
    writer = NightWrite.new
    translate = Translate.new("ab")
    assert_equal "0.0.\n..0.\n....", translate.translate_to_braille
  end

  def test_it_translates_capital_letters
    writer = NightWrite.new
    translate = Translate.new("A")
    assert_equal "..0.\n....\n.0..", translate.translate_to_braille
  end

  # def test_it_receives_input_from_cli
  #   translate = Translate.new(ARGV[0])
  #   assert_equal "000.0.\n....0.\n......\n", translate.translate_to_braille
  #
  # end

end
