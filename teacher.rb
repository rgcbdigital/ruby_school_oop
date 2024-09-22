class Teacher
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :department

  @@record = []

  def initialize(id, name, birth_date, email, phone_number, department)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @department = department
  end

  def save
    @@record.prepend(self)
  end

  def destroy
    @@record.delete(self)
  end

  def display
    "ID: #{@id}, Name: #{@name}, Birth Date: #{@birth_date}, Email: #{@email}, Phone: #{@phone_number}, Department: #{@department}"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.find { |teacher| teacher.id == id }
  end

  def self.find_by_email(email)
    @@record.find { |teacher| teacher.email == email }
  end
end