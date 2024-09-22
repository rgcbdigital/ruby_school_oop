class Subject
  attr_accessor :id, :name, :deleted_at

  @@record = []

  def initialize(id, name)
    @id = id
    @name = name
    @deleted_at = nil
  end

  def save
    existing_record = @@record.find { |subject| subject.id == @id }

    if existing_record
      existing_record.name = @name
      existing_record.deleted_at = @deleted_at
      puts "Subject updated successfully!"
    else
      @@record << self
      puts "Subject created successfully!"
    end
  end

  def destroy
    @deleted_at = Time.now
  end

  def display
    "ID: #{@id}, Name: #{@name}"
  end

  def self.all
    @@record ||= []
    @@record.select { |subject| subject.deleted_at.nil? }
  end

  def self.find(id)
    @@record.find { |subject| subject.id == id }
  end
end