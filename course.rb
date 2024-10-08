class Course
  attr_accessor :id, :name, :deleted_at

  @@record = []

  def initialize(id, name)
    @id = id
    @name = name
    @deleted_at = nil
  end

  def save
    existing_record = @@record.find { |course| course.id == @id }
    if existing_record
      existing_record.name = @name
      existing_record.deleted_at = @deleted_at
      puts "Course updated successfully!"
    else
      @@record << self
      puts "Course created successfully!"
    end
  end

  def destroy
    @deleted_at = Time.now
  end

  def display
    puts "ID: #{id}, Name: #{name}"
  end

  def students
    Student.all.select { |student| student.course_id == @id }
  end

  def subjects
    course_subjects = CourseSubject.find_by_course_id(@id)
    course_subjects.map { |cs| Subject.find(cs.subject_id) }.compact
  end

  def self.all
    @@record ||= []
    @@record.select { |course| course.deleted_at.nil? }
  end

  def self.find(id)
    @@record.find { |course| course.id == id }
  end
end