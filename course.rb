class Course
  attr_accessor :id, :name, :deleted_at

  @@record = []

  def initialize(id, name)
    @id = id
    @name = name
    @deleted_at = nil
  end

  def save
    @@record.prepend(self)
  end

  def destroy
    @deleted_at = Time.now
  end

  def display
    "ID: #{id}, Name: #{name}"
  end

  def self.all
    @@record ||= []
    @@record.select { |course| course.deleted_at.nil? }
  end

  def self.find(id)
    @@record.find { |course| course.id == id }
  end
end