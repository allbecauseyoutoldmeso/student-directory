@students = []



def add_students(name, cohort)
  newentry = {name: name, cohort: cohort}
  if @students.include? newentry
    puts "ERROR: #{name} is already listed in the directory."
  else
    @students << newentry
    puts "#{name} was successfully added to the directory."
  end
  puts "Now we have #{@students.count} students."
end


def input_students
  puts "Please enter the names of the students.\nTo finish, just hit return twice."
  name = STDIN.gets.chomp
  while !name.empty? do
    add_students(name, :november)
    name = STDIN.gets.chomp
  end
end


def show_students
  puts "\n" + "The students of Villains Academy\n".center(40)
  puts "---------------\n".center(40)
  @students.each do |student|
    puts "#{student[:name]}".ljust(20) + "(#{student[:cohort]} cohort)".rjust(20)
  end
  puts "\nOverall, we have #{@students.count} great students.\n\n"
end


def print_menu
  puts "1. Input the students."
  puts "2. Show the students."
  puts "3. Save the list to a file."
  puts "4. Load students from file."
  puts "9. Exit."
end


def save_students
  puts "Enter name of destination file."
  filename = gets.chomp
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "The following students have been saved to #{filename}:"
  @students.each do |student|
    puts student[:name]
  end
  file.close
end

def load_students
  puts "Enter name of source file."
  filename = gets.chomp
  puts "Adding students from #{filename}..."
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort.to_sym)
  end
  file.close
end


def process(selection)
 options = {"1" => "input_students", "2" => "show_students", "3" => "save_students", "4" => "load_students", "9" => "exit"}
 if options.include? selection
 self.send(options[selection])
 else
   puts "I'm sorry, I don't understand.  Please select an option."
 end
end


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end


interactive_menu
