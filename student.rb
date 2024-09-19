class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number

  @@record = []
  def save
    @@record.prepend(self)
  end

  def destroy
    @@record.delete(self)
  end

  def display
    puts "ID: #{self.id} Name: #{self.name} Birth_date: #{self.birth_date} Email: #{self.email}  Phone: #{self.phone_number}"
  end

  def self.all
    @@record
  end

  def self.find(id)
    return @@record.find { |student| student.id == id }
  end

  def self.find_by_email(email)
    @@record.find{|student_email| student_email == email}
  end
end