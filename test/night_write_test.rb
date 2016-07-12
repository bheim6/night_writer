gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require_relative '../lib/night_write'
# require 'dummy'
# require_relative '../lib/braille'

class NightWriteTest < Minitest::Test

 def test_runner_exists

   assert Runner

 end

 # def test_runner_can_read
 #   runner = Runner.new
 #   assert_equal true, runner.read
 # end

 def test_it_point_to_argument
   runner = Runner.new
   assert_equal  ARGV[0], runner.point
 end

 def test_it_can_read_file_from_cli
   runner = Runner.new
   content = File.read(ARGV[0])
   assert_equal content, runner.reader
 end

 def test_it_can_write_to_new_file
   runner = Runner.new
   content = File.read(ARGV[0])
   assert_equal File.write(ARGV[1], content), runner.writer
 end

 def test_it_can_count
   runner = Runner.new
   content = File.read(ARGV[0])
   File.write(ARGV[1], content)
   assert_equal content.length, runner.count
 end

 def test_it_prints_out_correct_info
   runner = Runner.new
   content = File.read(ARGV[0])
   File.write(ARGV[1], content)
   char = runner.count
   assert_equal "Created #{ARGV[1]} containing #{char} characters.", runner.characters
 end

 def test_it_counts_characters_in_file
 end

end
