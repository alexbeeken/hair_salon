class Stylist 
  attr_reader(:name)
  
  define_method(:initialize) do |attributes|
    @name = arributes.fetch("name")
  end
  
  define_save(:save) do
    