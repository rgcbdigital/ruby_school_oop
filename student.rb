class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :deleted_at

  @@record = []

  def initialize(id, name, birth_date, email, phone_number)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @deleted_at = nil
  end

  def save
    @@record.prepend(self)
  end

  def destroy
    @deleted_at = Time.now
  end

  def display
    puts "ID: #{id} Name: #{name} Birth Date: #{birth_date} Email: #{email} Phone: #{phone_number}"
  end

  def self.all
    @@record ||= []
    @@record.select { |student| student.deleted_at.nil? }
  end

  def self.find(id)
    @@record.find { |student| student.id == id }
  end

  def self.find_by_email(email)
    @@record.find { |student| student.email == email }
  end
end