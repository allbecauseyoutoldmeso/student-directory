@students = []
require "CSV"


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
  name = gets.chomp
  while !name.empty? do
    add_students(name, :november)
    name = gets.chomp
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
  puts "\nWhat do you want to do?\n1. Input the students\n2. Show the students\n3. Save the list to a file\n4. Load students from file\n9. Exit.\n\n"
end


def save_students
  puts "Enter name of destination file."
  filename = gets.chomp
  confirmation = "The following students have been saved to #{filename}:\n"
  if File.exists?(filename)
    File.open(filename, "w") do |file|
      @students.each do |student|
        file.puts [student[:name], student[:cohort]].join(",")
        confirmation << student[:name] + "\n"
      end
    end
    puts confirmation
  else
    puts "I'm sorry, there is no such file."
    save_students
  end
end


def load_students
  puts "Enter name of source file."
  filename = gets.chomp
  if File.exists?(filename)
    puts "Adding students from #{filename}..."
    file = File.open(filename, "r")
    CSV.foreach(filename) do |row|
      name = row[0]
      cohort = row[1]
      add_students(name, cohort.to_sym)
    end
    file.close
  else
    puts "I'm sorry, there is no such file."
    load_students
  end
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
    process(gets.chomp)
  end
end


interactive_menu
