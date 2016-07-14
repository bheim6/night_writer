require './lib/translate'

handle = File.open(ARGV[0], "r")

message = handle.read

handle.close


translate = Translate.new(message)


new_braille = translate.translate_to_braille


writer = File.open(ARGV[1], "w")

writer.write(new_braille)

writer.close
