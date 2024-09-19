require_relative 'student'
require_relative 'course'
require_relative 'subject'
require_relative 'teacher'

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

def new_course
  puts "Add new course"
  course_id = Course.all.size + 1
  puts "Enter course name:"
  course_name = gets.chomp
  course = Course.new(course_id, course_name)
  course.save

  if Course.find(course_id)
    puts "Course added successfully!"
    puts course.display
  else
    puts "Failed to add course."
  end
end

def delete_course
  puts "Delete a course"
  puts "Enter course ID to delete:"
  course_id = gets.chomp.to_i

  if course = Course.find(course_id)
    course.destroy
    puts "Course destroyed successfully!"
  else
    puts "Course with ID #{course_id} not found."
  end
end

def new_subject
  puts "Add new subject"
  subject_id = Subject.all.size + 1
  puts "Enter subject name:"
  subject_name = gets.chomp
  subject = Subject.new(subject_id, subject_name)
  subject.save

  if Subject.find(subject_id)
    puts "Subject added successfully!"
    puts subject.display
  else
    puts "Failed to add subject."
  end
end

def delete_subject
  puts "Delete a subject"
  puts "Enter subject ID to delete:"
  subject_id = gets.chomp.to_i

  if subject = Subject.find(subject_id)
    subject.destroy
    puts "Subject destroyed successfully!"
  else
    puts "Subject with ID #{subject_id} not found."
  end
end

def new_teacher
  puts "Add new teacher"
  teacher_id = Teacher.all.size + 1
  puts "Enter teacher name:"
  teacher_name = gets.chomp
  puts "Enter teacher birth date (YYYY-MM-DD):"
  teacher_birth_date = gets.chomp
  puts "Enter teacher email:"
  teacher_email = gets.chomp
  puts "Enter teacher phone number:"
  teacher_phone_number = gets.chomp
  puts "Enter teacher department:"
  teacher_department = gets.chomp
  teacher = Teacher.new(teacher_id, teacher_name, teacher_birth_date, teacher_email, teacher_phone_number, teacher_department)
  teacher.save

  if Teacher.find(teacher_id)
    puts "Teacher added successfully!"
    puts teacher.display
  else
    puts "Failed to add teacher."
  end
end

def delete_teacher
  puts "Delete a teacher"
  puts "Enter teacher ID to delete:"
  teacher_id = gets.chomp.to_i

  if teacher = Teacher.find(teacher_id)
    teacher.destroy
    puts "Teacher destroyed successfully!"
  else
    puts "Teacher with ID #{teacher_id} not found."
  end
end

def teacher_management
  while true
    puts "Teacher Management"
    puts "1. Add a new teacher"
    puts "2. Delete a teacher"
    puts "2. Back to main menu"
    choice = gets.chomp.to_i

    case choice
    when 1
      new_teacher
    when 2
      delete_teacher
    when 3
      break
    else
      puts "Invalid choice, please try again."
    end
  end
end


def subject_management
  while true
    puts "Subject Management"
    puts "1. Add a new subject"
    puts "2. Delete a subject"
    puts "3. Back to main menu"
    choice = gets.chomp.to_i

    case choice
    when 1
      new_subject
    when 2
      delete_subject
    when 3
      break
    else
      puts "Invalid choice, please try again."
    end
  end
end

def student_management
  while true
    puts "Student Management"
    puts "1. Add a new student"
    puts "2. Delete a student"
    puts "3. Back to main menu"
    choice = gets.chomp.to_i

    case choice
    when 1
      new_student
    when 2
      delete_student
    when 3
      break
    else
      puts "Invalid choice, please try again."
    end
  end
end

def course_management
  while true
    puts "Course Management"
    puts "1. Add a new course"
    puts "2. Delete a course"
    puts "3. Back to main menu"
    choice = gets.chomp.to_i

    case choice
    when 1
      new_course
    when 2
      delete_course
    when 3
      break
    else
      puts "Invalid choice, please try again."
    end
  end
end

def main_menu
  while true
    puts "Main Menu"
    puts "1. Student Management"
    puts "2. Course Management"
    puts "3. Subject Management"
    puts "4. Teacher Management"
    puts "5. Exit"
    choice = gets.chomp.to_i

    case choice
    when 1
      student_management
    when 2
      course_management
    when 3
      subject_management
    when 4
      teacher_management
    when 5
      puts "Exiting..."
      break
    else
      puts "Something seems to be wrong, please try again."
    end
  end
end

main_menu