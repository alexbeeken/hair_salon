class Customer
  attr_reader(:name, :stylist_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes.fetch(:id)
  end


#### INSTANCE METHODS

  define_method(:delete) do
    DB.exec("DELETE FROM customers WHERE id = #{@id};")
  end

  define_method(:save) do
    query = DB.exec("INSERT INTO customers (name, stylist_id) VALUES ('#{@name}', '#{@stylist_id}') RETURNING id;")
    @id = query[0]["id"]
  end


  define_method(:==) do |another_stylist|
    (self.name.==another_stylist.name)
  end


#### CLASS METHODS

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


define_singleton_method(:find_customer_by_id) do |id|
  query = DB.exec("SELECT * FROM customers WHERE id = '#{id}';")
    if query.ntuples == 0
      return false
    else
      name = query[0]["name"]
      stylist_id = query[0]["stylist_id"]
      id = query[0]["id"]
      return Customer.new({:name => name, :stylist_id => stylist_id, :id => id})
    end
  end

define_singleton_method(:find_customer_by_name) do |name|
    query = DB.exec("SELECT * FROM customers WHERE name = '#{name}';")
    if query.ntuples == 0
      return false
    else
      name = query[0]["name"]
      stylist_id = query[0]["stylist_id"]
      id = query[0]["id"]
      return Customer.new({:name => name, :stylist_id => stylist_id, :id => id})
    end
  end

  define_singleton_method(:get_customers_for_stylist_id) do |id|
    query = DB.exec("SELECT * FROM customers WHERE stylist_id = #{id};")
    all = []
    query.each() do |customer|
      name = customer.fetch("name")
      stylist_id = customer.fetch("stylist_id").to_i
      id = customer.fetch("id").to_i()
      all.push(Customer.new({:name => name, :stylist_id => stylist_id, :id => id}))
     end
    all
  end
end
