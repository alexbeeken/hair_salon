class Stylist 
  attr_reader(:name)
  
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
end