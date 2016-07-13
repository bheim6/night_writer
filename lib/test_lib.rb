# 0.|0.|00|00|0.|00|00|0.|.0|.0|0.|0.|00|00|0.|00|00|0.|.0|.0|0.|0.|.0|00|00|0.|..|..|..|..|..|..
# ..|0.|..|.0|.0|0.|00|00|0.|00|..|0.|..|.0|.0|0.|00|00|0.|00|..|0.|00|..|.0|.0|00|..|0.|..|00|0.
# ..|..|..|..|..|..|..|..|..|..|0.|0.|0.|0.|0.|0.|0.|0.|0.|0.|00|00|.0|00|00|00|0.|0.|..|00|.0|00
# a |b |c |d |e |f |g |h |i |j |k |l |m |n |o |p |q |r |s |t |u |v |w |x |y |z |! |' |, |- |. |?
#
# .0|.0|0.|0.|00|00|0.|00|00|0.|.0
# .0|00|..|0.|..|.0|.0|0.|00|00|0.
# 00|..|..|..|..|..|..|..|..|..|..
# # |0 |1 |2 |3 |4 |5 |6 |7 |8 |9
#
# Example:
# 0.|0.|0.|0.|0.|..|.0|0.|0.|0.|00
# 00|.0|0.|0.|.0|..|00|.0|00|0.|.0
# ..|..|0.|0.|0.|..|.0|0.|0.|0.|..
# h |e |l |l |o |  |w |o |r |l |d

test_lib = {"a" => ["0.", "..", ".."], "b" => ["0.", "0.", ".."], "c" => ["00", "..", ".."], " " => ["..", "..", ".."]}


.
From: /Users/bheim6/turing/1module/night_writer/test/translate_test.rb @ line 35 TranslateTest#test_it_translates_two_letters:

    32: def test_it_translates_two_letters
    33:   writer = NightWrite.new
    34:   translate = Translate.new("ab")
 => 35:   binding.pry
    36:   assert_equal "0.0.\n..0.\n....", translate.translate_to_braille
    37:
    38: end

[1] pry(#<TranslateTest>)> translate.input
=> "ab"
[2] pry(#<TranslateTest>)> input = translate.input
=> "ab"
[3] pry(#<TranslateTest>)> library = {"a" => ["0.", "..", ".."], "b" => ["0.", "0.", ".."], "c" => ["00", "..", ".."], " " => ["..", "..", ".."]}
=> {"a"=>["0.", "..", ".."], "b"=>["0.", "0.", ".."], "c"=>["00", "..", ".."], " "=>["..", "..", ".."]}
[4] pry(#<TranslateTest>)> library[input]
=> nil
[5] pry(#<TranslateTest>)> input.chars
=> ["a", "b"]
[6] pry(#<TranslateTest>)> library[input.chars]
=> nil
[7] pry(#<TranslateTest>)> translated =  input.chars.each do |char|
[7] pry(#<TranslateTest>)*   library[char]
[7] pry(#<TranslateTest>)* end
=> ["a", "b"]
[8] pry(#<TranslateTest>)> translated
=> ["a", "b"]
[9] pry(#<TranslateTest>)> translated =  input.chars.map do |char|
[9] pry(#<TranslateTest>)*   library[char]
[9] pry(#<TranslateTest>)* end
=> [["0.", "..", ".."], ["0.", "0.", ".."]]
[10] pry(#<TranslateTest>)> translated
=> [["0.", "..", ".."], ["0.", "0.", ".."]]
[11] pry(#<TranslateTest>)> translated.transpose
=> [["0.", "0."], ["..", "0."], ["..", ".."]]
[12] pry(#<TranslateTest>)> translated.transpose.join("\n")
=> "0.\n0.\n..\n0.\n..\n.."
[13] pry(#<TranslateTest>)> translated.transpose
=> [["0.", "0."], ["..", "0."], ["..", ".."]]
[14] pry(#<TranslateTest>)> translated.transpose.map do |array|
[14] pry(#<TranslateTest>)*   array.join
[14] pry(#<TranslateTest>)* end
=> ["0.0.", "..0.", "...."]
[15] pry(#<TranslateTest>)> rows = translated.transpose.map do |array|
[15] pry(#<TranslateTest>)*   array.join
[15] pry(#<TranslateTest>)* end
=> ["0.0.", "..0.", "...."]
[16] pry(#<TranslateTest>)> rows
=> ["0.0.", "..0.", "...."]
[17] pry(#<TranslateTest>)> rows.join("\n")
=> "0.0.\n..0.\n...."
