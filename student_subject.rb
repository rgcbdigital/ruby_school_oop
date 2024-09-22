class StudentSubject
  attr_accessor :id, :student_id, :subject_id

  @@record = []

  def initialize(id, student_id, subject_id)
    @id = id
    @student_id = student_id
    @subject_id = subject_id
  end

  def save
    existing_record = @@record.find { |record| record.id == @id }
    if existing_record
      existing_record.student_id = @student_id
      existing_record.subject_id = @subject_id
      puts "StudentSubject updated successfully!"
    else
      @@record << self
      puts "StudentSubject created successfully!"
    end
  end

  def destroy
    @@record.delete(self)
    puts "StudentSubject deleted."
  end

  def display
    subject = Subject.find(@subject_id)
    subject_name = subject ? subject.name : "Unknown"
    "ID: #{@id}, Student ID: #{@student_id}, Subject ID: #{@subject_id}, Subject Name: #{subject_name}"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.find { |record| record.id == id }
  end

  def self.find_by_student_id(student_id)
    @@record.select { |record| record.student_id == student_id }
  end
end