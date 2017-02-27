def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students."
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(40)
  puts "---------------".center(40)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]}".ljust(20) + "(#{student[:cohort]} cohort)".rjust(20)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)
