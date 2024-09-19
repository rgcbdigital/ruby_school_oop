require_relative 'student'

def new_student
  puts "Add new student"
  student_id = Student.all.size + 1
  puts "Enter student name:"
  student_name = gets.chomp
  puts "Enter student birth date (YYYY-MM-DD):"
  student_birth_date = gets.chomp
  puts "Enter student email:"
  student_email = gets.chomp
  puts "Enter student phone number:"
  student_phone_number = gets.chomp
  student = Student.new(student_id, student_name, student_birth_date, student_email, student_phone_number)
  student.save

  if Student.find(student_id)
    puts "Student added successfully!"
    student.display
  else
    puts "Failed to add student."
  end
end

def delete_student
  puts "Delete a student"
  puts "Enter student ID to delete:"
  student_id = gets.chomp.to_i

  if student = Student.find(student_id)
    student.destroy
    puts "Student destroyed successfully!"
  else
    puts "Student with ID #{student_id} not found."
  end
end

def main_menu
  while true
    puts "Choose an action:"
    puts "1. Add a new student"
    puts "2. Delete a student"
    puts "3. Exit"
    choice = gets.chomp.to_i

    case choice
    when 1
      new_student
    when 2
      delete_student
    when 3
      puts "Exiting..."
      break
    else
      puts "Something seems to be wrong, please try again."
    end
  end
end

main_menu