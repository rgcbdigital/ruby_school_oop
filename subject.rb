class Subject
  attr_accessor :id, :name

  @@records = []

  def initialize(id, name)
    @id = id
    @name = name
  end

  def save
    @@record.prepend(self)
  end

  def destroy
    @@records.delete(self)
  end

  def display
    "ID: #{@id}, Name: #{@name}"
  end

  def self.all
    @@records
  end

  def self.find(id)
    @@records.find { |subject| subject.id == id }
  end
end