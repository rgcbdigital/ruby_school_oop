class Teacher
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :department, :deleted_at

  @@record = []

  def initialize(id, name, birth_date, email, phone_number, department)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @department = department
    @deleted_at = nil
  end

  def save
    existing_record = @@record.find { |teacher| teacher.id == @id }
    if existing_record
      existing_record.name = @name
      existing_record.birth_date = @birth_date
      existing_record.email = @email
      existing_record.phone_number = @phone_number
      existing_record.department = @department
      existing_record.deleted_at = @deleted_at
      puts "Teacher updated successfully!"
    else
      @@record << self
      puts "Teacher created successfully!"
    end
  end

  def destroy
    @deleted_at = Time.now
  end

  def display
    "ID: #{@id}, Name: #{@name}, Birth Date: #{@birth_date}, Email: #{@email}, Phone: #{@phone_number}, Department: #{@department}"
  end

  def self.all
    @@record ||= []
    @@record.select { |teacher| teacher.deleted_at.nil? }
  end

  def self.find(id)
    @@record.find { |teacher| teacher.id == id }
  end

  def self.find_by_email(email)
    @@record.find { |teacher| teacher.email == email }
  end
end