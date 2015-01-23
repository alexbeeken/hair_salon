require('spec_helper')
require('stylist')

describe('#name') do
  it 'displays the name of a stylist' do
    test_stylist = Stylist.new({:name => "Tina", :id => nil})
    expect(test_stylist.name).to(eq("Tina"))
  end
end

describe('#save') do
  it 'saves the stylist to the database' do
    test_stylist = Stylist.new({:name => "Tina", :id => nil})
    test_stylist.save()
    expect(Stylist.all).to(eq([test_stylist]))
  end
end

describe('.all') do
  it 'displays all stylists from the database' do
    expect(Stylist.all).to(eq([]))
  end
end

describe('#==') do
  it 'compares two stylists correctly' do
    test_stylist = Stylist.new({:name => "Tina", :id => nil})
    test_stylist2 = Stylist.new({:name => "Tina", :id => nil})
    expect(test_stylist).to(eq(test_stylist2))
  end
end
