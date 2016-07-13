require 'pry'

class NightWrite
  def point
    ARGV[0]
  end

  def reader
    File.read(ARGV[0])
  end

  def writer
    content = File.read(ARGV[0])
    File.write(ARGV[1], content)
  end

  def counter
    @num = File.read(ARGV[1])
    num.length
  end

  def characters
    @char = File.read(ARGV[1]).length.to_s
    p "Created #{ARGV[1]} containing #{@char} characters."
  end

end

# tes = NightWrite.new
# tes.writer
#
# tes.characters
