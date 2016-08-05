gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require './lib/night_write'

class NightWriteTest < Minitest::Test

  def test_runner_exists
    assert NightWrite
  end

  def test_it_point_to_argument
    runner = NightWrite.new
    assert_equal  ARGV[0], runner.point
  end

  def test_it_can_read_file_from_cli
    runner = NightWrite.new
    content = File.read(ARGV[0])
    assert_equal content, runner.reader
  end

  def test_it_can_write_to_new_file
    runner = NightWrite.new
    content = File.read(ARGV[0])
    assert_equal File.write(ARGV[1], content), runner.writer
  end

  def test_it_can_count
    runner = NightWrite.new
    content = File.read(ARGV[0])
    File.write(ARGV[1], content)
    assert_equal content.length, runner.counter
  end

  def test_it_prints_out_correct_info
    runner = NightWrite.new
    content = File.read(ARGV[0])
    File.write(ARGV[1], content)
    char = runner.counter
    assert_equal "Created #{ARGV[1]} containing #{char} characters.", runner.characters
  end
end
