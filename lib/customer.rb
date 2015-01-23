class Customer
  attr_reader(:name, :stylist_id, :id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes.fetch(:id)
  end
  
  define_method(:save) do
    query = DB.exec("INSERT INTO customers (name, stylist_id) VALUES ('#{@name}', '#{@stylist_id}') RETURNING id;")
    @id = query[0]["id"]
  end
  
  define_singleton_method(:all) do
    query = DB.exec("SELECT * FROM customers;")
    all = []
    query.each() do |customer|
      name = customer.fetch("name")
      stylist_id = customer.fetch("stylist_id").to_i
      id = customer.fetch("id").to_i()
      all.push(Customer.new({:name => name, :stylist_id => stylist_id, :id => id}))
     end
    all
  end
  
  define_method(:==) do |another_stylist|
    (self.name.==another_stylist.name)
  end
end