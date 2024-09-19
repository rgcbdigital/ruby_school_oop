class Subject
  attr_accessor :id, :name

  @@record = []

  def initialize(id, name)
    @id = id
    @name = name
  end

  def save
    @@record.prepend(self)
  end

  def destroy
    @@record.delete(self)
  end

  def display
    "ID: #{@id}, Name: #{@name}"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.find { |subject| subject.id == id }
  end
end