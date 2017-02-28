@students = []
@options = {"1" => "input_students", "2" => "show_students", "3" => "save_students", "4" => "load_students", "9" => "exit"}


def add_students(name, cohort)
  newentry = {name: name, cohort: cohort}
  if @students.include? newentry
    puts "ERROR: #{name} is already listed in the directory."
  else
    @students << newentry
  end 
end


def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
  name = STDIN.gets.chomp
  while !name.empty? do
    add_students(name, :november)
    puts "Now we have #{@students.count} students."
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
  @options.each do |x,y|
  puts "#{x}: #{y}"
end
end


def save_students
  file = File.open("../.gitignore/students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "Saved #{@students.count} students to ../.gitignore/students.csv."
  file.close
end

def load_students(filename = "../.gitignore/students.csv")
  file = File.open(filename, "r")
  added = 0
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort.to_sym)
    added +=1
  end
  puts "Loaded #{added} students from #{filename}."
  puts "Now we have #{@students.count} students."
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "../.gitignore/students.csv"
  end
  load_students(filename)
end

def process(selection)
 if @options.include? selection
 self.send(@options[selection])
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

try_load_students
interactive_menu
