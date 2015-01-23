require('spec_helper')
require('customer')

describe('#name') do
  it 'displays the name of a customer' do
    test_customer = Customer.new({:name => "Shirley", :stylist_id => 1, :id => nil})
    expect(test_customer.name).to(eq("Shirley"))
  end
end

describe('#save') do
  it 'saves the customer to the database' do
    test_customer = Customer.new({:name => "Shirley", :stylist_id => 1, :id => nil})
    test_customer.save()
    expect(Customer.all).to(eq([test_customer]))
  end
end

describe('.all') do
  it 'displays all customers from the database' do
    expect(Customer.all).to(eq([]))
  end
end

describe('#==') do
  it 'compares two customers correctly' do
      test_customer = Customer.new({:name => "Shirley", :stylist_id => 1, :id => nil})
      test_customer2 = Customer.new({:name => "Shirley", :stylist_id => 1, :id => nil})
      expect(test_customer).to(eq(test_customer2))
  end
end

describe('#delete') do
    it 'removes customer from the database' do
      test_customer = Customer.new({:name => "Shirley", :stylist_id => 0, :id => nil})
      test_customer.save()
      test_customer2 = Customer.new({:name => "Shirley2", :stylist_id => 0, :id => nil})
      test_customer2.save()
      test_customer.delete()
      expect(Customer.all).to(eq([test_customer2]))
  end
end

  
describe('#find_customer_by_id') do
    it 'finds a customer by their id' do
       test_customer = Customer.new({:name => "Shirley", :stylist_id => 0, :id => nil})
       test_customer.save()
       expect(Customer.find_customer_by_id(test_customer.id)).to(eq(test_customer))
  end
end
  
describe('#find_customer_by_name') do
    it 'finds a customer by their name' do
      test_customer = Customer.new({:name => "Shirley", :stylist_id => 0, :id => nil})
      test_customer.save()
      expect(Customer.find_customer_by_name(test_customer.name)).to(eq(test_customer))
  end
end

describe('#get_customers_for_stylist_id') do
  it 'returns all customers associated with that stylist id' do
    test_customer = Customer.new({:name => 'Shirley', :stylist_id => 1, :id => nil})
    test_customer.save()
    expect(Customer.get_customers_for_stylist_id(1)).to(eq([test_customer]))
  end
end


      