class Stylist 
  attr_reader(:name, :id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end
  
  define_method(:save) do
    query = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = query[0]["id"].to_i
  end
  
  define_singleton_method(:all) do
    query = DB.exec("SELECT * FROM stylists;")
    all = []
    query.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      all.push(Stylist.new({:name => name, :id => id}))
     end
    all
  end
  
  define_method(:==) do |another_stylist|
    (self.name.==another_stylist.name)
  end
  
  define_method(:delete) do 
    DB.exec("DELETE FROM stylists WHERE id = #{@id};")
    # customers.remove_customers_for_stylist_id(@id)
  end
  
  define_singleton_method(:find_stylist_by_id) do |id|
    query = DB.exec("SELECT * FROM stylists WHERE id = '#{id}';")
    if query.ntuples == 0
      return false
    else
      name = query[0]["name"]
      id = query[0]["id"]
      return Stylist.new(:name => name, :id => id)
    end
  end
  
  define_singleton_method(:find_stylist_by_name) do |name|
    query = DB.exec("SELECT * FROM stylists WHERE name = '#{name}';")
    if query.ntuples == 0
      return false
    else
      name = query[0]["name"]
      id = query[0]["id"]
      return Stylist.new(:name => name, :id => id)
    end
  end
  
end