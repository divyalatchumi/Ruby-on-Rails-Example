class Customer
  def initialize(id, name)
    @id = id
    @name = name
  end
  def display()
    puts "Customer ID: #{@id}","Customer Name: #{@name}"
  end
end

obj = Customer.new("1","John Doe")
obj2 = Customer.new("2","Jane Doe")
obj.display
obj2.display
