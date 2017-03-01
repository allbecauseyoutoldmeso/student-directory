File.open("../.gitignore/students.csv", "r") do | file |
  file.readlines.each do |line|
    puts line
  end
end
