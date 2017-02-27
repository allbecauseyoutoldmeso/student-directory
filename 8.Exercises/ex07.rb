def input_students

  validcohorts = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december', 'unknown']

  students = []
  puts "Please enter the name of the student."
  name = gets.chomp

  while !name.empty? do
    puts "Please enter the cohort."
    cohort = gets.chomp.downcase

    while !validcohorts.include? cohort
      puts "Please enter a vaild cohort, or 'unknown'."
      cohort = gets.chomp.downcase
    end

    students << {name: name, cohort: cohort.to_sym}
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
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)
