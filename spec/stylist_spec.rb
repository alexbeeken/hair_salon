require('spec_helper')
require('stylist')

#### CLASS METHODS

describe('.all') do
  it 'displays all stylists from the database' do
    expect(Stylist.all).to(eq([]))
  end
end

#### INSTANCE METHODS

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


describe('#==') do
  it 'compares two stylists correctly' do
    test_stylist = Stylist.new({:name => "Tina", :id => nil})
    test_stylist2 = Stylist.new({:name => "Tina", :id => nil})
    expect(test_stylist).to(eq(test_stylist2))
  end
end

describe('#delete') do
  it 'removes stylist from the database' do
    test_stylist = Stylist.new({:name => "Tina", :id => nil})
    test_stylist.save()
    test_stylist2 = Stylist.new({:name => "Tina2", :id => nil})
    test_stylist2.save()
    test_stylist.delete()
    expect(Stylist.all).to(eq([test_stylist2]))
  end
end

describe('#find_stylist_by_id') do
  it 'finds a stylist by their id' do
    test_stylist = Stylist.new({:name => "Tina", :id => nil})
    test_stylist.save()
    expect(Stylist.find_stylist_by_id(test_stylist.id)).to(eq(test_stylist))
  end
end

describe('#find_stylist_by_name') do
  it 'finds a stylist by their name' do
    test_stylist = Stylist.new({:name => "Tina", :id => nil})
    test_stylist.save()
    expect(Stylist.find_stylist_by_name(test_stylist.name)).to(eq(test_stylist))
  end
end
