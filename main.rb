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

new_student
