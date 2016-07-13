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

  # def test_breaks_file_into_chars
  #   skip
  #   runner = NightWrite.new
  #   translate = Translate.new("a")
  #   runner.writer
  #   file_characters = File.readlines(ARGV[1])
  #   assert_equal file_characters, translate.separate
  #   # binding.pry
  # end

  def test_it_translates_a_lcase_letter
    writer = NightWrite.new
    translate = Translate.new("a")
    assert_equal "0.\n..\n..", translate.translate_to_braille
  end

  def test_it_translates_two_letters
    writer = NightWrite.new
    translate = Translate.new("ab")
    # binding.pry
    assert_equal "0.0.\n..0.\n....", translate.translate_to_braille
  end

  def test_it_translates_capital_letters
    writer = NightWrite.new
    translate = Translate.new("A")
    assert_equal "..0.\n....\n.0..", translate.translate_to_braille
  end







end
