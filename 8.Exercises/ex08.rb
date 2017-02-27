validcohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december, :unknown]

def input_students(cohorts)

  students = []
  puts "Please enter the name of the student."
  name = gets.chomp

  while !name.empty? do
    puts "Please enter the cohort."
    cohort = gets.chomp.downcase.to_sym

    while !cohorts.include? cohort
      puts "Please enter a vaild cohort, or 'unknown'."
      cohort = gets.chomp.downcase.to_sym
    end

    students << {name: name, cohort: cohort}
    puts "Please enter the name of the next student.  To finish press enter twice."
    name = gets.chomp
  end

  puts students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print(students, cohorts)

  cohorts.each do |x|
    puts "Students in the #{x.to_s.capitalize} cohort:"
     students.each do |student|
       if student[:cohort] == x
       puts "#{student[:name]}"
       end
     end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

def onecohort(students, cohort)
  puts "Students in the #{cohort} cohort:"
  students.each do |student|
    if student[:cohort] == cohort.downcase.to_sym
      puts "#{student[:name]}"
    end
  end
end

students = input_students(validcohorts)
print_header
print(students, validcohorts)
print_footer(students)

puts "Alternative method..."

onecohort(students, 'November')
