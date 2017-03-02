file = File.open(__FILE__, 'r')
puts file.readlines
file.close

puts "\nSay it again block-style...\n\n"

File.open(__FILE__, "r") do |file|
  puts file.readlines
end
