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
  puts "The Elles of Villains Academy are..."
end

def printells(students)
  students.each.with_index(1) do |student, index|
    if student[:name][0] == 'L'
    puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end


students = input_students
print_header
printells(students)
