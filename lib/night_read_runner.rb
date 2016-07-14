require './lib/night_read'

handle = File.open(ARGV[0], "r")

message = handle.read

handle.close


translate = NightRead.new(message)


new_english = translate.translate_to_english


writer = File.open(ARGV[1], "w")

writer.write(new_english)

writer.close
