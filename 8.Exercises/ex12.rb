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



def print(students)
  if students.count == 0
    puts "The Villains Academy probably needs a better recruitment strategy :-("
  else
    puts "The students of Villains Academy"
    puts "---------------"
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
    puts "Overall, we have #{students.count} great students."
  end
end


students = input_students
print(students)
