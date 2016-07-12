gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/three_lines'

class ThreeLineTest < Minitest::Test

  def test_it_outputs_input_three_times
    lines = ThreeLines.new("word")
    assert_equal "#{"word"}\n#{"word"}\n#{"word"}", lines.change_to_three
  end

end
