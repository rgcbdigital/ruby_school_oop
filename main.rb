require_relative 'student'
require_relative 'course'
require_relative 'subject'
require_relative 'teacher'
require_relative 'course_subject'

def display_course_details
  print "Enter Course ID to display details: "
  course_id = gets.chomp.to_i
  course = Course.find(course_id)

  if course
    course.display
    while true
      puts "1. View Students"
      puts "2. View Subjects"
      puts "3. Back to Course Management"
      print "Please choose an option: "
      choice = gets.chomp.to_i

      case choice
      when 1
        display_course_students(course)
      when 2
        display_course_subjects(course.id)
      when 3
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  else
    puts "Course not found."
  end
end

def display_course_students(course)
  puts "Students in Course ID #{course.id}:"
  students = course.students
  if students.empty?
    puts "No students enrolled in this course."
  else
    students.each { |student| student.display }
  end
end

def display_course_subjects(course_id)
  subjects = CourseSubject.find_by_course_id(course_id)
  if subjects.empty?
    puts "No subjects assigned to this course."
  else
    puts "Subjects assigned to Course ID #{course_id}:"
    subjects.each { |subject| puts "Subject ID: #{subject.id}, Name: #{subject.name}" }
  end
end

def add_subjects_to_course
  display_available_courses
  print "Enter Course ID to add subjects: "
  course_id = gets.chomp.to_i

  while true
    print "Enter Subject ID to add (or type 'done' to finish): "
    input = gets.chomp
    break if input.downcase == 'done'

    subject_id = input.to_i
    if Subject.find(subject_id)
      existing_record = CourseSubject.all.find { |cs| cs.course_id == course_id && cs.subject_id == subject_id }
      unless existing_record
        cs_id = CourseSubject.all.size + 1
        course_subject = CourseSubject.new(cs_id, course_id, subject_id)
        course_subject.save
      else
        puts "This subject is already with the course."
      end
    else
      puts "Subject not found."
    end
  end
end

def remove_subjects_from_course
  print "Enter Course ID to remove subjects: "
  course_id = gets.chomp.to_i

  subjects = CourseSubject.find_by_course_id(course_id)
  if subjects.empty?
    puts "No subjects assigned to this course."
  else
    while true
      display_course_subjects(course_id)
      print "Enter Subject ID to remove (or type 'done' to finish): "
      input = gets.chomp
      break if input.downcase == 'done'

      subject_id = input.to_i
      cs_record = subjects.find { |cs| cs.subject_id == subject_id }
      if cs_record
        cs_record.destroy
        subjects.delete(cs_record)
      else
        puts "Subject is not with this course."
      end
    end
  end
end

def display_available_courses
  puts "Available Courses:"
  Course.all.each { |course| puts "ID: #{course.id}, Name: #{course.name}" }
end

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

  display_available_courses
  print "Enter Course ID for the student: "
  course_id = gets.chomp.to_i

  student = Student.new(student_id, student_name, student_birth_date, student_email, student_phone_number, course_id)
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

def display_students
  puts "Displaying all students:"
  Student.all.each do |student|
    print student.display
  end
end

def edit_student
  print "Enter Student ID to edit: "
  id = gets.chomp.to_i
  student = Student.find(id)
  if student
    print "Enter New Student Name: "
    student.name = gets.chomp
    print "Enter New Birth Date: "
    student.birth_date = gets.chomp
    print "Enter New Email: "
    student.email = gets.chomp
    print "Enter New Phone Number: "
    student.phone_number = gets.chomp

    display_available_courses
    print "Enter New Course ID for the student: "
    student.course_id = gets.chomp.to_i

    student.save
  else
    puts "Student not found."
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

def display_courses
  puts "Displaying all courses:"
  Course.all.each do |course|
    puts course.display
  end
end

def edit_course
  print "Enter Course ID to edit: "
  id = gets.chomp.to_i
  course = Course.find(id)
  if course
    print "Enter New Course Name: "
    course.name = gets.chomp
    course.save
  else
    puts "Course not found."
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

def display_subjects
  puts "Displaying all subjects:"
  Subject.all.each do |subject|
    puts subject.display
  end
end

def edit_subject
  print "Enter Subject ID to edit: "
  id = gets.chomp.to_i
  subject = Subject.find(id)
  if subject
    print "Enter New Subject Name: "
    subject.name = gets.chomp
    subject.save
  else
    puts "Subject not found."
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

def display_teachers
  puts "Displaying all teachers:"
  Teacher.all.each do |teacher|
    puts teacher.display
  end
end

def edit_teacher
  print "Enter Teacher ID to edit: "
  id = gets.chomp.to_i
  teacher = Teacher.find(id)
  if teacher
    print "Enter New Teacher Name: "
    teacher.name = gets.chomp
    print "Enter New Birth Date: "
    teacher.birth_date = gets.chomp
    print "Enter New Email: "
    teacher.email = gets.chomp
    print "Enter New Phone Number: "
    teacher.phone_number = gets.chomp
    print "Enter New Department: "
    teacher.department = gets.chomp
    teacher.save
  else
    puts "Teacher not found."
  end
end

def teacher_management
  while true
    puts "Teacher Management"
    puts "1. Add a new teacher"
    puts "2. Delete a teacher"
    puts "3. Display all teachers"
    puts "4. Edit Teacher"
    puts "5. Back to School Management"
    choice = gets.chomp.to_i

    case choice
    when 1
      new_teacher
    when 2
      delete_teacher
    when 3
      display_teachers
    when 4
      edit_teacher
    when 5
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
    puts "3. Display all subjects:"
    puts "4. Edit Subject"
    puts "5. Back to School Management"
    choice = gets.chomp.to_i

    case choice
    when 1
      new_subject
    when 2
      delete_subject
    when 3
      display_subjects
    when 4
      edit_subject
    when 5
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
    puts "3. Display all students"
    puts "4. Edit Student"
    puts "5. Back to School Management"
    choice = gets.chomp.to_i

    case choice
    when 1
      new_student
    when 2
      delete_student
    when 3
      display_students
    when 4
      edit_student
    when 5
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
    puts "3. Display all Courses"
    puts "4. Edit Course"
    puts "5. Display Course Details"
    puts "6. Add Subjects to Course"
    puts "7. Remove Subjects from Course"
    puts "8. Back to School Management"
    choice = gets.chomp.to_i

    case choice
    when 1
      new_course
    when 2
      delete_course
    when 3
      display_courses
    when 4
      edit_course
    when 5
      display_course_details
    when 6
      add_subjects_to_course
    when 7
      remove_subjects_from_course
    when 8
      break
    else
      puts "Invalid choice, please try again."
    end
  end
end

def main_menu
  while true
    puts "School Management"
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