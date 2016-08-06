require './lib/translate'

handle = File.open(ARGV[0], "r")

message = handle.read

handle.close


translate = Translate.new(message)


new_braille = translate.translate_to_braille


writer = File.open(ARGV[1], "w")

writer.write(new_braille)

writer.close

char = File.read(ARGV[1]).length.to_s
puts "Created #{ARGV[1]} containing #{char} characters."
