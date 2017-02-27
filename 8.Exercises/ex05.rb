def input_students

  students = []
  puts "Please enter the name of the student."
  name = gets.chomp

  while !name.empty? do
    puts "Please enter the student's date of birth."
    dob = gets.chomp
    puts "Please enter the student's country of origin."
    country = gets.chomp
    puts "Please enter the student's favourite colour."
    colour = gets.chomp
    students << {name: name, dob: dob, country: country, colour: colour}
    puts "Please enter the name of the next student.  To finish press enter twice."
    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (DOB: #{student[:dob]}; Country of origin: #{student[:country]}; Favourite colour: #{student[:colour]}.)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)
