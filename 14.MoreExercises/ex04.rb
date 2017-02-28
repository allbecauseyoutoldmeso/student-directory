@students = []
@options = {"1" => "input_students", "2" => "show_students", "3" => "save_students", "4" => "load_students", "5" => "check_file_text", "9" => "exit"}


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
  @options.each do |x,y|
  puts "#{x}: #{y}"
end
end


def save_students
  file = File.open("../.gitignore/students.csv", "w")
  confirmation = "The following students have been saved to ../.gitignore/students.csv:\n"
  @students.each do |student|
    file.puts [student[:name], student[:cohort]].join(",")
    confirmation << student[:name] + "\n"
  end
  puts confirmation
  file.close
end

def load_students(filename = "../.gitignore/students.csv")
  puts "Adding students from #{filename}..."
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort.to_sym)
  end
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

def check_file_text
  puts "This is the data currently saved to ../.gitignore/students.csv:"
  txt = open("../.gitignore/students.csv")
  print txt.read
end


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
