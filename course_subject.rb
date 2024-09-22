class CourseSubject
  attr_accessor :id, :course_id, :subject_id

  @@record = []

  def initialize(id, course_id, subject_id)
    @id = id
    @course_id = course_id
    @subject_id = subject_id
  end

  def save
    existing_record = @@record.find { |record| record.id == @id }
    if existing_record
      existing_record.course_id = @course_id
      existing_record.subject_id = @subject_id
      puts "Course Subject updated successfully!"
    else
      @@record << self
      puts "Course Subject created successfully!"
    end
  end

  def destroy
    @@record.delete(self)
    puts "Course Subject deleted."
  end

  def display
    "ID: #{@id}, Course ID: #{@course_id}, Subject ID: #{@subject_id}"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.find { |record| record.id == id }
  end
end