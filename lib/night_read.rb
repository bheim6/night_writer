require './lib/night_reader'

handle = File.open(ARGV[0], "r")

message = handle.read

handle.close


translate = NightReader.new(message)


new_english = translate.translate_to_english


writer = File.open(ARGV[1], "w")

writer.write(new_english)

writer.close

char = File.read(ARGV[1]).length.to_s
puts "Created #{ARGV[1]} containing #{char} characters."
